import 'package:flutter/material.dart';
import 'Constants.dart';
import 'CustomePadding.dart';
import 'CustomeTexts.dart';
import 'RippleEffectContainer.dart';

class CustomeRadioButton extends StatelessWidget {
  const CustomeRadioButton(
      {super.key,
      required this.onTap,
      required this.isEnabled,
      this.rippleColor,
      required this.title});
  final VoidCallback onTap;
  final bool isEnabled;
  final Color? rippleColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      rippleColor: rippleColor,
      borderRadius: BorderRadius.circular(10),
      child: CP(
        h: 5,
        v: 5,
        child: Row(
          children: [
            SizedBox(
              height: 17,
              child: isEnabled == true
                  ? Image.asset("assets/images/radioEnabled.png")
                  : Image.asset("assets/images/radioDisable.png"),
            ),
            title == "" ? const SizedBox(width: 0) : const SizedBox(width: 5),
            TextFW700(
              text: title,
              fontSize: 14,
              textcolor: isEnabled == true ? Colors.black : blackO7,
            )
          ],
        ),
      ),
    );
  }
}
