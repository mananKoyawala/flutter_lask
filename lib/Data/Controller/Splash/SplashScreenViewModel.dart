import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/OTPController.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Presentation/Screen/AuthenticationScreen.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Screen/SignInScreen.dart';

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
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() {
      update();
      status(initScreen);

      // print('.................' + initScreen.toString());
    });
    animationController.forward().then((value) => Navigator.push(
          Get.context!,
          MaterialPageRoute(builder: (_) => status(initScreen)),
        ));
  }
}

status(int? initScreen) {
  SharedPreference pref = Get.find<SharedPreference>();
  if (initScreen == 0 || initScreen == null) {
    return WelcomeScreen();
  } else if (pref.u_email.value == '' ||
      pref.u_password.value == '' ||
      pref.u_mobileNumber.value == '' ||
      pref.u_email.isEmpty ||
      pref.u_password.isEmpty ||
      pref.u_mobileNumber.isEmpty) {
    return SignInScreen();
  } else {
    return Dashboard();
  }
}
