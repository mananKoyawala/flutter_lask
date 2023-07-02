import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'Presentation/Screen/ExploreScreen.dart';
import 'Presentation/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int? initScreen;
Future<void> main() async {
  SharedPreference controller = Get.put(SharedPreference());
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: Default)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  // print('initScreen ${initScreen}');
  await prefs.setInt("initScreen", 1);
  // controller.change(initScreen);

  // print('initScreen ${initScreen}');
  print('###########${controller.u_email}');
  print('###########${controller.u_password}');
  print('###########${controller.u_mobileNumber}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: materialThemeColor, fontFamily: 'fonts'),
        // home: SignInScreen()
        home: ExploreScreen()
        // SplashScreen(
        //   initScreen: initScreen,
        // ),
        );
  }
}

//! Pagination completed but first it code by getx
