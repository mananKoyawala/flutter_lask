import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/RippleEffectContainer.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:intl/intl.dart';
import '../../Data/Controller/GreetingController.dart';
import '../../Package/CustomePadding.dart';
import 'package:get/get.dart';
// ignore_for_file: must_be_immutable

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ScrollController scrollController = ScrollController();
  final Greeting greetings = Get.put(Greeting());
  SharedPreference preference = Get.find<SharedPreference>();

  @override
  Widget build(BuildContext context) {
    print('User\'s Name :- ${preference.u_name.value.split(' ')[0]}');
    return Scaffold(
      body: ScrollColorRemove(
        child: CP(
          h: 16,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45),
                color: background1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<Greeting>(builder: (greet) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => TextFW400(
                                text:
                                    '${greet.greeting.value}, ${preference.u_name.value.split(' ')[0]}',
                                fontSize: 14,
                                textcolor: textColor2),
                          ),
                          TextFW600(
                            text: DateFormat('EE dd MMM, yyyy')
                                .format(DateTime.now()),
                            fontSize: 18,
                            textcolor: black,
                          )
                        ],
                      );
                    }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 24,
                            child: Image.asset('assets/images/sun.png')),
                        sizeW10(),
                        TextFW600(
                          text: 'Sunny 32oC',
                          fontSize: 14,
                          textcolor: textColor2,
                        )
                      ],
                    )
                  ],
                ),
              ),
              sizeH(20),
              Expanded(
                  child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: ListView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          NewContainer(
                            onTap: () {},
                            imgUrl: 'assets/images/img1.png',
                            title:
                                "Experience the Serenity of Japan's Traditional Countryside",
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
                            onTap: () {},
                            imgUrl: 'assets/images/img2.png',
                            title:
                                "Discovering the Magic of Paris: A Journey through",
                            category: 'Technology',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          NewContainer(
                            onTap: () {},
                            imgUrl: 'assets/images/img3.png',
                            title: "The Pros and Cons of Remote Work",
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
                            imgUrl: 'assets/images/img4.png',
                            onTap: () {},
                            title: "The Pros and Cons of Remote Work",
                            category: 'Technology',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          NewContainer(
                            imgUrl: 'assets/images/img3.png',
                            title: "The Pros and Cons of Remote Work",
                            onTap: () {},
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
                            imgUrl: 'assets/images/img4.png',
                            onTap: () {},
                            title: "The Pros and Cons of Remote Work",
                            category: 'Technology',
                          )
                        ],
                      ),
                    ),
                    sizeH(60)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  const NewContainer({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.category,
    required this.onTap,
  });
  final String imgUrl;
  final String title;
  final String category;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 230,
              decoration: BoxDecoration(borderRadius: radius(10)),
              child: Image.asset(imgUrl)),
          sizeH(20),
          SizedBox(
            width: 230,
            height: 50,
            child: TextFW600(
              maxLines: 2,
              text: title,
              fontSize: 20,
              textcolor: black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          sizeH10(),
          TextFW400(
            text: category,
            fontSize: 14,
            textcolor: textColor2,
          )
        ],
      ),
    );
  }
}
