import 'package:flutter/material.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';

import '../../Package/CustomePadding.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
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
                    Column(
                      children: [
                        TextFW400(
                            text: 'Good Morning, Trung',
                            fontSize: 14,
                            textcolor: textColor2),
                        TextFW600(
                          text: 'Sun 9 April, 2023',
                          fontSize: 18,
                          textcolor: black,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 30,
                            child: Image.asset('assets/images/sun.png')),
                        sizeW10(),
                        TextFW600(
                          text: 'Sunny 32oC',
                          fontSize: 16,
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
                            imgUrl: 'assets/images/img1.png',
                            title:
                                "Experience the Serenity of Japan's Traditional Countryside",
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
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
                            imgUrl: 'assets/images/img3.png',
                            title: "The Pros and Cons of Remote Work",
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
                            imgUrl: 'assets/images/img4.png',
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
                            category: 'Technology',
                          ),
                          sizeW(20),
                          NewContainer(
                            imgUrl: 'assets/images/img4.png',
                            title: "The Pros and Cons of Remote Work",
                            category: 'Technology',
                          )
                        ],
                      ),
                    ),
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
  });
  final String imgUrl;
  final String title;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
