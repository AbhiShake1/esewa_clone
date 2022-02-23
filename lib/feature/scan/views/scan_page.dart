import 'dart:convert';

import 'package:esewa_clone/feature/payment/views/payment_amount_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'scan_app_bar.dart';

class ScanPage extends HookWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flashOn = useValueNotifier(false);
    QRViewController? _controller;
    useEffect(() => _controller?.dispose, []);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            QRView(
              key: GlobalKey(debugLabel: 'QR Scanner'),
              overlay: QrScannerOverlayShape(
                borderColor: context.accentColor,
                borderLength: 30,
                borderWidth: 8,
                cutOutSize: context.screenWidth / 1.5,
              ),
              onQRViewCreated: (controller) async {
                _controller = controller;
                controller.scannedDataStream.listen((barCode) async {
                  try {
                    Map<String, dynamic> qrResult = json.decode(barCode.code!);
                    context.navigator?.pushReplacement(MaterialPageRoute(
                      builder: (context) => PaymentAmountPage(qrResult: qrResult),
                    ));
                    controller.pauseCamera();
                  } on Exception {
                    context.showToast(msg: 'Invalid barcode');
                  }
                });
              },
              onPermissionSet: (_, allowed) {
                if (!allowed) context.showToast(msg: 'No permission');
              },
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await _controller?.toggleFlash();
                      flashOn.value = !flashOn.value;
                    },
                    icon: HookBuilder(
                      builder: (context) {
                        final toggle = useValueListenable<bool>(flashOn);
                        return Icon(
                          toggle ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                          size: 70,
                        );
                      },
                    ),
                  ),
                  'Scan QR Code to Pay'.text.xl2.make(),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.cancel, size: 70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
