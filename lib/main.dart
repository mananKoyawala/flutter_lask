import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Presentation/Screen/ArticaleScreen.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Utils/Widgets/SearchPage.dart';
import 'Presentation/Screen/ClappedArticalesScreen.dart';
import 'Presentation/Screen/ExploreScreen.dart';
import 'Presentation/Screen/ForgetPasswordScreen.dart';
import 'Presentation/Screen/MyAccountScreen.dart';
import 'Presentation/Screen/OTPScreen.dart';
import 'Presentation/Screen/ProfileScreen.dart';
import 'Presentation/Screen/SearchResult.dart';
import 'Presentation/Screen/SignInScreen.dart';
import 'Presentation/Screen/SignUpScreen.dart';
import 'Presentation/Screen/SplashScreen.dart';
import 'Presentation/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: materialThemeColor, fontFamily: 'fonts'),
      home: OTPScreen(),
    );
  }
}
