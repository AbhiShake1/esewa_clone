import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.all(20),
        child: title.text.xl2.semiBold.black.make(),
        decoration: BoxDecoration(
          color: context.accentColor,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
