import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../enums/icon_position.dart';

class PointsBar extends StatelessWidget {
  const PointsBar({
    Key? key,
    required this.icon,
    required this.borderRadius,
    this.iconPosition = IconPosition.leading,
    this.currency,
    required this.points,
  }) : super(key: key);

  final IconData icon;
  final BorderRadiusGeometry borderRadius;
  final IconPosition iconPosition;
  final String? currency;
  final double points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.screenWidth / 2 - 15,
          margin: const EdgeInsets.only(top: 10, left: 10),
          alignment: iconPosition == IconPosition.leading
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: EdgeInsets.only(
            right:
                iconPosition == IconPosition.leading ? context.screenWidth / 9 : 15,
            left:
                iconPosition == IconPosition.trailing ? context.screenWidth / 9 : 15,
            top: 15,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconPosition == IconPosition.leading)
                Icon(icon, color: context.accentColor).pOnly(right: 15),
              10.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      (currency ?? '      ')
                          .text
                          .subtitle2(context)
                          .scale(1.2)
                          .make(),
                      10.widthBox,
                      points.text.xl3.make(),
                    ],
                  ),
                  'Balance'.text.subtitle2(context).xl2.make(),
                ],
              ),
              if (iconPosition == IconPosition.trailing)
                Icon(icon, color: context.accentColor).pOnly(left: 15),
            ],
          ),
        )
      ],
    );
  }
}
