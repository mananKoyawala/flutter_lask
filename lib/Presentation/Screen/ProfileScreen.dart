// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomePadding.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:lask/Presentation/Screen/ClappedArticalesScreen.dart';
import 'package:lask/Presentation/Screen/OfflineReadingScreen.dart';
import 'package:lask/Presentation/Screen/ReadArticalesScreen.dart';
import 'package:get/get.dart';
import 'MyAccountScreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  SharedPreference pref = Get.find<SharedPreference>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollColorRemove(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: CP(
          h: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeH(45),
              Row(
                children: [
                  CircleAvatar(
                      radius: 55,
                      child: Image.asset(
                        'assets/images/person1.png',
                        height: 150,
                      )),
                  sizeW(20),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFW600(
                          text: pref.u_name.value,
                          fontSize: 24,
                          textcolor: textColorMain),
                      sizeH10(),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/i1.png',
                            height: 24,
                          ),
                          sizeW10(),
                          const TextFW400(
                              text: 'Bookworm',
                              fontSize: 14,
                              textcolor: Colors.blue)
                        ],
                      )
                    ],
                  ))
                ],
              ),
              sizeH25(),
              const Row(
                children: [
                  Item(
                    title: 'Article Read',
                    subtitle: '320',
                  ),
                  Item(
                    title: 'Streak',
                    subtitle: '365 Days',
                  ),
                  Item(
                    title: 'Level',
                    subtitle: '125',
                  ),
                ],
              ),
              sizeH10(),
              Divider(color: rippleColor),
              sizeH10(),
              TextFW600(
                  text: 'Reading History',
                  fontSize: 24,
                  textcolor: textColorMain),
              sizeH10(),
              SingleAccountItem(
                title: 'Clapped Articles',
                onTap: () {
                  Get.to(() => ClappedArticalesScreen());
                },
                vPadd: 15,
              ),
              sizeH10(),
              SingleAccountItem(
                title: 'Read Articles',
                onTap: () {
                  Get.to(() => ReadArticalesScreen());
                },
                vPadd: 15,
              ),
              sizeH10(),
              TextFW600(
                  text: 'Settings', fontSize: 24, textcolor: textColorMain),
              sizeH10(),
              SingleAccountItem(
                title: 'My Account',
                onTap: () {
                  Get.to(() => MyAccountScreen());
                },
                vPadd: 15,
              ),
              sizeH10(),
              SingleAccountItem(
                title: 'Privacy Setting',
                onTap: () {},
                vPadd: 15,
              ),
              sizeH10(),
              SingleAccountItem(
                title: 'Offline Reading',
                onTap: () {
                  Get.to(() => OfflineReadingScreen());
                },
                vPadd: 15,
              ),
              sizeH10(),
              SingleAccountItem(
                title: 'About Us',
                onTap: () {},
                vPadd: 15,
              ),
              sizeH(60)
            ],
          ),
        ),
      )),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFW400(
          text: title,
          fontSize: 14,
          textcolor: black,
        ),
        sizeH10(),
        TextFW600(
          text: subtitle,
          fontSize: 24,
          textcolor: textColorMain,
        ),
      ],
    ));
  }
}
