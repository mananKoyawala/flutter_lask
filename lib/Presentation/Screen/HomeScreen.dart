import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/RippleEffectContainer.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:intl/intl.dart';
import 'package:lask/Presentation/Screen/ArticaleScreen.dart';
import '../../Data/Controller/API/HomeController.dart';
import '../../Data/Controller/GreetingController.dart';
import '../../Package/CustomePadding.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jumping_dot/jumping_dot.dart';
// ignore_for_file: must_be_immutable

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ScrollController scrollController = ScrollController();
  final Greeting greetings = Get.put(Greeting());
  SharedPreference preference = Get.find<SharedPreference>();
  HomeController homeController = Get.put(HomeController());
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
                        height: 335,
                        child: Obx(
                          () => homeController.isLoading.value
                              ? horizontalShimmer()
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.list1.length,
                                  itemBuilder: (context, index) {
                                    return NewContainer(
                                      onTap: () {
                                        Get.to(() => ArticaleScreen(
                                            article:
                                                homeController.list1[index]));
                                      },
                                      imgUrl: homeController
                                          .list1[index].urlToImage,
                                      title: homeController.list1[index].title,
                                      category:
                                          homeController.list1[index].author,
                                    );
                                  },
                                ),
                        )),
                    sizeH(15),
                    SizedBox(
                        height: 335,
                        child: Obx(
                          () => homeController.isLoading.value
                              ? horizontalShimmer()
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.list2.length,
                                  itemBuilder: (context, index) {
                                    return NewContainer(
                                      onTap: () {
                                        Get.to(() => ArticaleScreen(
                                            article:
                                                homeController.list2[index]));
                                      },
                                      imgUrl: homeController
                                          .list2[index].urlToImage,
                                      title: homeController.list2[index].title,
                                      category:
                                          homeController.list2[index].author,
                                    );
                                  },
                                ),
                        )),
                    sizeH(15),
                    SizedBox(
                        height: 335,
                        child: Obx(
                          () => homeController.isLoading.value
                              ? horizontalShimmer()
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.list3.length,
                                  itemBuilder: (context, index) {
                                    return NewContainer(
                                      onTap: () {
                                        Get.to(() => ArticaleScreen(
                                            article:
                                                homeController.list3[index]));
                                      },
                                      imgUrl: homeController
                                          .list3[index].urlToImage,
                                      title: homeController.list3[index].title,
                                      category:
                                          homeController.list3[index].author,
                                    );
                                  },
                                ),
                        )),
                    sizeH(15),
                    SizedBox(
                        height: 335,
                        child: Obx(
                          () => homeController.isLoading.value
                              ? horizontalShimmer()
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.list4.length,
                                  itemBuilder: (context, index) {
                                    return NewContainer(
                                      onTap: () {
                                        Get.to(() => ArticaleScreen(
                                            article:
                                                homeController.list4[index]));
                                      },
                                      imgUrl: homeController
                                          .list4[index].urlToImage,
                                      title: homeController.list4[index].title,
                                      category:
                                          homeController.list4[index].author,
                                    );
                                  },
                                ),
                        )),
                    sizeH(15),
                    SizedBox(
                        height: 335,
                        child: Obx(
                          () => homeController.isLoading.value
                              ? horizontalShimmer()
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.list5.length,
                                  itemBuilder: (context, index) {
                                    return NewContainer(
                                      onTap: () {
                                        Get.to(() => ArticaleScreen(
                                            article:
                                                homeController.list5[index]));
                                      },
                                      imgUrl: homeController
                                          .list5[index].urlToImage,
                                      title: homeController.list5[index].title,
                                      category:
                                          homeController.list5[index].author,
                                    );
                                  },
                                ),
                        )),
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
    return Row(
      children: [
        ClickEffect(
          onTap: onTap,
          borderRadius: radius(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image(imgUrl),
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
              FittedBox(
                child: TextFW400(
                  text: category,
                  fontSize: 14,
                  textcolor: textColor2,
                ),
              ),
            ],
          ),
        ),
        sizeW(20)
      ],
    );
  }
}

image(String imgUrl) {
  return ClipRRect(
    borderRadius: radius(10),
    child: CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
          height: 230,
          width: 230,
        );
      },
      placeholder: (context, url) => Container(
        height: 230,
        width: 230,
        alignment: Alignment.center,
        child: Center(
          child: JumpingDots(
            color: themeColor,
            radius: 10,
            numberOfDots: 3,
            animationDuration: const Duration(milliseconds: 200),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
          height: 230,
          width: 230,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/imageisnotavialable.jpg',
            fit: BoxFit.cover,
          )),
    ),
  );
}
