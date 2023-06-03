import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Presentation/Screen/SplashScreen.dart';
import 'Presentation/Utils/Constants.dart';

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
      home: const SplashScreen(),
    );
  }
}
