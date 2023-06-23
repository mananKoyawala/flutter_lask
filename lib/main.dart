import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/GreetingController.dart';
import 'package:lask/Data/Controller/OTPController.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Presentation/Screen/ArticaleScreen.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Utils/Widgets/SearchPage.dart';
import 'Presentation/Screen/AuthenticationScreen.dart';
import 'Presentation/Screen/ClappedArticalesScreen.dart';
import 'Presentation/Screen/ExploreScreen.dart';
import 'Presentation/Screen/ForgetPasswordScreen.dart';
import 'Presentation/Screen/MyAccountScreen.dart';
import 'Presentation/Screen/OTPScreen.dart';
import 'Presentation/Screen/ProfileScreen.dart';
import 'Presentation/Screen/S_1.dart';
import 'Presentation/Screen/SearchResult.dart';
import 'Presentation/Screen/SignInScreen.dart';
import 'Presentation/Screen/SignUpScreen.dart';
import 'Presentation/Screen/SplashScreen.dart';
import 'Presentation/Constants.dart';
import 'package:intl/intl.dart';
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
  print('initScreen ${initScreen}');
  await prefs.setInt("initScreen", 1);
  // controller.change(initScreen);

  print('initScreen ${initScreen}');
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
          //  S_1()
          SplashScreen(
        initScreen: initScreen,
      ),
      // initialBinding: Bind(),
    );
  }
}
