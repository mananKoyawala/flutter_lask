import 'package:flutter/material.dart';

import '../../../../Package/Constants.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../../Package/RippleEffectContainer.dart';

class CustomeRightIconButton extends StatelessWidget {
  const CustomeRightIconButton({
    super.key,
    required this.height,
    required this.width,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
    this.textColor,
    this.isIcon,
    required this.borderRadius,
    this.fontWeight,
  });
  final Color? textColor;
  final double height;
  final double width;
  final double borderRadius;
  final FontWeight? fontWeight;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final bool? isIcon;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: radius(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.save_outlined, color: backgroundColor),
            TextFW500(
              text: label,
              fontSize: 16,
              fontWeight: fontWeight,
              textcolor: textColor ?? white,
            ),
            isIcon == true ? Icon(icon, color: white) : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class DissableButton extends StatelessWidget {
  const DissableButton({
    super.key,
    required this.height,
    required this.width,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    this.textColor,
    this.isIcon,
  });
  final Color? textColor;
  final double height;
  final double width;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final bool? isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: DP.infinity(context),
      decoration:
          BoxDecoration(color: backgroundColor, borderRadius: radius(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.save_outlined, color: backgroundColor),
          TextFW500(
            text: label,
            fontSize: 16,
            textcolor: textColor ?? white,
          ),
          isIcon == true ? Icon(icon, color: white) : const SizedBox()
        ],
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.height,
    required this.width,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
    this.textColor,
  });
  final Color? textColor;
  final double height;
  final double width;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        width: DP.infinity(context),
        decoration:
            BoxDecoration(color: backgroundColor, borderRadius: radius(10)),
        child: TextFW500(
          text: label,
          fontSize: 16,
          textcolor: textColor ?? white,
        ),
      ),
    );
  }
}
