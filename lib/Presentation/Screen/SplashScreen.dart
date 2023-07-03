import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Presentation/Screen/SignInScreen.dart';
import 'package:lask/Presentation/Screen/WelcomeScreen.dart';
import '../../Data/Controller/SharedPreferences.dart';
import '../Constants.dart';
import 'Dashboard.dart';

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
    print('*********${controller.u_email.value}');
    print('*********${controller.u_password.value}');
    print('*********${controller.u_mobileNumber.value}');
    print('*********${controller.u_name.value}');
    if (widget.initScreen == 0 || widget.initScreen == null) {
      Get.offAll(() => const WelcomeScreen());
    } else if (controller.u_email.value == '' ||
        controller.u_password.value == '' ||
        controller.u_mobileNumber.value == '' ||
        controller.u_email.isEmpty ||
        controller.u_password.isEmpty ||
        controller.u_mobileNumber.isEmpty) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => Dashboard());
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
