import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/OTPController.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';

import '../../../Presentation/Screen/WelcomeScreen.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final int? initScreen;

  SplashScreenViewModel(this.initScreen);
  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    OTPController controller = OTPController();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() {
      update();
      initScreen == 0 || initScreen == null ? WelcomeScreen() : Dashboard();

      // print('.................' + initScreen.toString());
    });
    animationController.forward().then((value) => Navigator.push(
          Get.context!,
          MaterialPageRoute(
              builder: (_) => initScreen == 0 || initScreen == null
                  ? WelcomeScreen()
                  : Dashboard()),
        ));
  }
}
