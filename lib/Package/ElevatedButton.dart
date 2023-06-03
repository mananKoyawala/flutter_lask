import 'package:flutter/material.dart';
import 'Constants.dart';
import 'RippleEffectContainer.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final double height;
  final double width;
  final String label;
  final double? size;
  final double? latterspacing;
  final Color? bgcolor;
  final Color? txtcolor;
  final FontWeight? weight;
  final double radius;
  final TextAlign? textAlign;
  final Widget? icon;
  final bool? isShadow;
  const CustomButton(
      {super.key,
      this.txtcolor,
      required this.radius,
      this.weight,
      this.textAlign,
      required this.onPress,
      required this.height,
      required this.width,
      required this.label,
      this.size,
      this.latterspacing,
      this.bgcolor,
      this.icon,
      this.isShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            isShadow == true
                ? BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                    color: rippleColor,
                    spreadRadius: 0)
                : const BoxShadow()
          ]),
      child: ClickEffect(
        rippleColor: Colors.grey.shade300,
        onTap: onPress,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(radius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: icon),
              icon != null
                  ? const SizedBox(width: 10)
                  : const SizedBox(width: 0),
              Text(
                label,
                textAlign: textAlign,
                style: TextStyle(
                    fontWeight: weight,
                    color: txtcolor,
                    fontSize: size,
                    letterSpacing: latterspacing),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.textStyle,
      required this.title});
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            splashFactory: NoSplash.splashFactory),
        onPressed: onPressed,
        child: Text(title, style: textStyle));
  }
}
