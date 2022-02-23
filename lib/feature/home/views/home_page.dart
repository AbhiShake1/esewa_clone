import 'package:esewa_clone/feature/scan/views/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/enums/icon_position.dart';
import '../../../core/widgets/points_bar.dart';

part 'home_app_bar.dart';
part 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: const HomeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push((context) => const ScanPage()),
        child: const Icon(Icons.qr_code_scanner),
      ).scale(scaleValue: 1.5),
    );
  }
}
