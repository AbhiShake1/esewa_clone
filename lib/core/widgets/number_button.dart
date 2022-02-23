import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({Key? key, required this.onPressed, required this.numberText})
      : super(key: key);

  final void Function() onPressed;
  final String numberText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: numberText.text.xl4.make(),
      style: ElevatedButton.styleFrom(
        animationDuration: const Duration(milliseconds: 0),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ).copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(context.cardColor),
      ),
    );
  }
}
