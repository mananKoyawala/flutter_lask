// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Data/Controller/WebViewController.dart';
import 'package:lask/Presentation/Screen/SplashScreen.dart';
import 'Data/Controller/NetworkController.dart';
import 'Presentation/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int? initScreen;
Future<void> main() async {
  Get.put<NetwrokController>(NetwrokController(), permanent: true);
  SharedPreference controller = Get.put(SharedPreference());
  WebController webViewController = Get.put(WebController());

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: Default)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  // print('initScreen ${initScreen}');
  await prefs.setInt("initScreen", 1);

  print('###########${controller.u_email}');
  print('###########${controller.u_password}');
  print('###########${controller.u_mobileNumber}');
  print('###########${controller.u_doc}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: materialThemeColor, fontFamily: 'fonts'),
      home:
          // ForgetPasswordscreen1()
          SplashScreen(initScreen: initScreen),
    );
  }
}
