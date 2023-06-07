import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Package/Constants.dart';

import '../../Data/Controller/Splash/SplashScreenViewModel.dart';
import '../Constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Container(
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
              ));
        },
      ),
    );
  }
}
