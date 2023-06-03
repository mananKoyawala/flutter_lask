import 'package:flutter/material.dart';
import 'Constants.dart';
import 'CustomeTexts.dart';
import 'RippleEffectContainer.dart';

class UniversalButton extends StatefulWidget {
  const UniversalButton({
    Key? key,
    required this.title,
    required this.radius,
    required this.backgroundColor,
    required this.borderColor,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    required this.onTap,
    required this.showBorder,
  }) : super(key: key);
  final String title;
  final double radius;
  final Color backgroundColor;
  final Color borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final VoidCallback onTap;
  final bool showBorder;

  @override
  State<UniversalButton> createState() => _UniversalButtonState();
}

class _UniversalButtonState extends State<UniversalButton> {
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      borderRadius: BorderRadius.circular(widget.radius),
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 88,
        decoration: BoxDecoration(
            border: widget.showBorder == true
                ? Border.all(color: widget.borderColor, width: 1.5)
                : const Border(),
            color: widget.showBorder == false ? widget.backgroundColor : white,
            borderRadius: BorderRadius.circular(widget.radius)),
        child: TextFW500(
          text: widget.title,
          fontSize: widget.fontSize ?? 18,
          textcolor:
              widget.showBorder == false ? widget.textColor ?? white : black,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
        ),
      ),
    );
  }
}
