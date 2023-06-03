import 'package:flutter/material.dart';

import 'Constants.dart';
import 'RippleEffectContainer.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.borderColor,
    required this.fontWeight,
    required this.fontSize,
    required this.textColor,
    required this.height,
    required this.width,
    this.radius,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final Color borderColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final double width;
  final Color textColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      borderRadius: BorderRadius.circular(radius ?? 10),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(radius ?? 10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: fontWeight, fontSize: fontSize, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
