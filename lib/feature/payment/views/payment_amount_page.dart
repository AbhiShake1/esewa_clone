import 'package:esewa_clone/core/widgets/number_button.dart';
import 'package:esewa_clone/feature/payment/views/payment_amount_app_bar.dart';
import 'package:esewa_clone/feature/payment/views/purpose_page.dart';
import 'package:esewa_clone/feature/scan/views/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/widgets/expanded_button.dart';

part 'payment_amount_number_buttons_area.dart';

class PaymentAmountPage extends StatelessWidget {
  const PaymentAmountPage({Key? key, required this.qrResult}) : super(key: key);

  final Map<String, dynamic> qrResult;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.navigator?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ScanPage(),
          ),
        );
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            PaymentAmountAppBar(
              onBack: () => context.navigator?.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ScanPage(),
                ),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  qrResult['name'].toString().text.bold.xl2.make(),
                  5.heightBox,
                  'eSewa ID - ${qrResult['eSewa_id']}'
                      .text
                      .gray400
                      .xl2
                      .subtitle1(context)
                      .make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Use Secured Transfer'.text.xl2.make(),
                      HookBuilder(
                        builder: (context) {
                          final visibility = useState<bool>(false);
                          return Switch.adaptive(
                            thumbColor: MaterialStateProperty.all<Color?>(
                                context.accentColor),
                            value: visibility.value,
                            onChanged: (newVal) => visibility.value = newVal,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ).pOnly(top: 30, right: 30, left: 30),
            ),
            40.heightBox,
            PaymentAmountNumberButtonsArea(qrResult: qrResult),
          ],
        ),
      ),
    );
  }
}
