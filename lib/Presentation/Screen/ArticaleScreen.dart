// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/API/NewModel.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Presentation/Constants.dart';

import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';

class ArticaleScreen extends StatelessWidget {
  ArticaleScreen({super.key, required this.article});
  ScrollController scrollController = ScrollController();
  final ArticleModel article;
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
                    onPressed: () {},
                    icon: Image.asset('assets/icons/hand.png', height: 22)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/share.png', height: 22)),
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
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
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
                              TextFW400(
                                  text:
                                      '${article.author} · ${article.publishedAt.substring(0, 10)}',
                                  fontSize: 12,
                                  textcolor: textColor2)
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
                          text: article.content,
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
