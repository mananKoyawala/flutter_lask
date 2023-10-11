// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/NewModel.dart';
import 'package:lask/Package/Constants.dart';
import '../../Data/Controller/OfflineReadingController.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../Constants.dart';
import '../Utils/Widgets/AddressItem.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import 'WebViewScreen.dart';

class OfflineReadingScreen extends StatelessWidget {
  OfflineReadingScreen({
    super.key,
  });

  // BusinessController businessController = Get.put(BusinessController());
  OfflineReadingController controller = Get.put(OfflineReadingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CP(
        h: 16,
        child: Column(
          children: [
            sizeH(45),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Nav.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                TextFW600(
                  text: 'Offline Articles',
                  fontSize: 18,
                  textcolor: textColorMain,
                ),
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_back,
                      color: white,
                    ))
              ],
            ),
            sizeH25(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value == true) {
                  return Center(
                    child: JumpingDots(
                      color: themeColor,
                      radius: 10,
                      numberOfDots: 3,
                      animationDuration: const Duration(milliseconds: 200),
                    ),
                  );
                }

                if (controller.articles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/json/nodatafound.json',
                            height: DP.dHeight(context, 2)),
                        sizeH(150)
                      ],
                    ),
                  );
                }

                return Column(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: controller.articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final article = ArticleModel(
                            author: controller.articles[index]['author'],
                            title: controller.articles[index]['title'],
                            description: controller.articles[index]
                                ['description'],
                            url: '',
                            urlToImage: controller.articles[index]
                                ['urlToImage'],
                            content: controller.articles[index]['description'],
                            publishedAt: controller.articles[index]
                                    ['publishedAt'] ??
                                '2023-06-2899',
                            isOffline: false);
                        return AddressItem(
                            title: controller.articles[index]['title'],
                            onTap: () {
                              Get.to(() => DetailScreen(
                                    article: article,
                                    url: controller.articles[index]['url'],
                                  ));
                            },
                            imgurl: controller.articles[index]['urlToImage'],
                            authorname: controller.articles[index]['author'],
                            datetime: controller.articles[index]
                                    ['publishedAt'] ??
                                '2023-06-2899');
                      },
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.article, required this.url});
  ScrollController scrollController = ScrollController();
  final ArticleModel article;
  OfflineReadingController controller = Get.find<OfflineReadingController>();
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Container(
        height: 50,
        width: DP.infinity(context),
        color: Color(0xFFFF0000).withOpacity(.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Nav.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => WebViewScreen(urlToLaunch: url));
                    },
                    icon: Image.asset('assets/icons/hand.png', height: 22)),
                IconButton(
                    onPressed: () {
                      controller.deleteArticle(article.title, url);
                    },
                    icon: const Icon(Icons.delete)),
                sizeW10()
              ],
            )
          ],
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: DP.infinity(context),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    height: 80,
                    width: 120,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 80,
                      width: 120,
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
                        height: 80,
                        width: 120,
                        alignment: Alignment.center,
                        child: Image.asset(
                            'assets/images/imageisnotavialable.jpg')),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      margin: const EdgeInsets.only(top: 260),
                      // height: 140,
                      width: DP.infinity(context),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFW600(
                            text: article.title,
                            fontSize: 20,
                            textcolor: textColorMain,
                          ),
                          sizeH10(),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/person1.png',
                                height: 24,
                              ),
                              sizeW10(),
                              sizeW10(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FittedBox(
                                      child: TextFW400(
                                          text: article.author,
                                          fontSize: 12,
                                          textcolor: textColor2),
                                    ),
                                    TextFW400(
                                        text: article.publishedAt
                                            .substring(0, 10),
                                        fontSize: 12,
                                        textcolor: textColor2),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: CP(
              h: 16,
              child: Container(
                color: white,
                child: RawScrollbar(
                  controller: scrollController,
                  radius: const Radius.circular(10),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      children: [
                        TextFW400(
                          text: article.description,
                          fontSize: 16,
                          textcolor: textColor3,
                        ),
                        sizeH25(),
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
