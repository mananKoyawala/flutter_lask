import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../Presentation/Screen/WelcomeScreen.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() {
      update();
      WelcomeScreen();
    });
    animationController.forward().then((value) => Navigator.push(
          Get.context!,
          MaterialPageRoute(builder: (_) => WelcomeScreen()),
        ));
  }
}
