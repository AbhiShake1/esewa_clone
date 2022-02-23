import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentAmountAppBar extends StatelessWidget {
  const PaymentAmountAppBar({Key? key, this.onBack}) : super(key: key);

  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 170,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: context.theme.appBarTheme.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_backspace_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    if (onBack == null) {
                      context.pop();
                    } else {
                      onBack!.call();
                    }
                  },
                ),
                30.widthBox,
                'Send Money'.text.xl2.make()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: context.accentColor,
                    size: 30,
                  ),
                  20.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          'NPR'.text.subtitle1(context).scale(1.2).make(),
                          10.widthBox,
                          '5000.75'.text.xl2.bold.make(),
                        ],
                      ),
                      'Balance'.text.scale(1.3).make(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
