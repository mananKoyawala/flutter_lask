import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/ElevatedButton.dart';
import 'package:lask/Package/CustomeRightIconButton.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:get/get.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Screen/HomeScreen.dart';

import '../../Package/CustomePadding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CP(
        h: 16,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: DP.height(context, .5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizeH(45),
                  TextFW600(
                    text: 'Get The Latest News \nAnd Updates',
                    fontSize: 32,
                    textcolor: textColorMain,
                  ),
                  sizeH(15),
                  TextFW400(
                    text:
                        'From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.',
                    fontSize: 14,
                    textcolor: textColor2,
                  ),
                  sizeH(30),
                  CustomeRightIconButton(
                    height: 50,
                    width: 174,
                    label: 'Explore',
                    icon: Icons.arrow_forward,
                    backgroundColor: themeColor,
                    isIcon: true,
                    onTap: () => Navigator.pushAndRemoveUntil(
                      Get.context!,
                      MaterialPageRoute(builder: (_) => Dashboard()),
                      (route) => false,
                    ),
                    textColor: white,
                    borderRadius: 128,
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: DP.infinity(context),
                child: Image.asset('assets/images/welcomeBG.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
