import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Presentation/Screen/SignInScreen.dart';
import 'package:lask/Presentation/Screen/WelcomeScreen.dart';

import '../../Data/Controller/SharedPreferences.dart';
import '../../Data/Controller/Splash/SplashScreenViewModel.dart';
import '../Constants.dart';
import 'Dashboard.dart';
import 'MyAccountScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, this.initScreen}) : super(key: key);
  final int? initScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreference controller = Get.find<SharedPreference>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    next();
  }

  Future<void> next() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    setState(() {
      move();
    });
  }

  move() {
    // Get.to(() => S_2());
    if (widget.initScreen == 0 || widget.initScreen == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      controller.isAuthenticated.value == 0
          ? Get.offAll(() => SignInScreen())
          : Get.offAll(() => Dashboard());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // GetBuilder<SplashScreenViewModel>(
            //   init: SplashScreenViewModel(initScreen),
            //   builder: (controller) {
            //     return
            Container(
                alignment: Alignment.center,
                height: DP.infinity(context),
                width: DP.infinity(context),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [themeColor, white])),
                child: Image.asset(
                  'assets/images/splashImage.png',
                  height: 280,
                ))
        // ;
        // },
        // ),
        );
  }
}
