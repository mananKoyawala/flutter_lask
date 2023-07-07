// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/BookMarkController.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/RippleEffectContainer.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:get/get.dart';
import '../../Package/CustomePadding.dart';

import '../Utils/Widgets/CommingSoon.dart';

class BookmarkedScreen extends StatelessWidget {
  BookmarkedScreen({super.key});
  ScrollController scrollController = ScrollController();
  BookMarkController bookMarkController = Get.find<BookMarkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
        child: CP(
          h: 16,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45),
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextFW600(text: 'Bookmark', fontSize: 24),
                    Obx(
                      () => bookMarkController.isShow.value
                          ? ClickEffect(
                              onTap: () => bookMarkController.changeStatus(),
                              borderRadius: radius(10),
                              child: CircleAvatar(
                                backgroundColor: white,
                                radius: 24,
                                child: TextFW600(
                                  text: 'Done',
                                  fontSize: 14,
                                  textcolor: blue,
                                ),
                              ))
                          : IconButton(
                              onPressed: () =>
                                  bookMarkController.changeStatus(),
                              icon: Icon(
                                Icons.edit_outlined,
                                color: textColorMain,
                              )),
                    )
                  ],
                ),
              ),
              sizeH(10),
              const CommingSoon(),
              sizeH(60)
              // Expanded(
              //     child: SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   controller: scrollController,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [

              // ListView.builder(
              //   physics: const BouncingScrollPhysics(),
              //   padding: const EdgeInsets.all(0),
              //   controller: scrollController,
              //   itemCount: 10,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return AddressItem(
              //         bookMarkController: bookMarkController,
              //         title:
              //             "Experience the Serenity of Japan's Traditional Countryside",
              //         onTap: () {},
              //         imgurl: 'assets/images/person1.png',
              //         authorname: 'Harry Harper',
              //         datetime: 'Apr 12, 2023');
              // },
              // ),
              //     ],
              //   ),
              // )),
              // sizeH(60)
            ],
          ),
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.imgurl,
      required this.authorname,
      required this.datetime,
      required this.bookMarkController});
  final String title;
  final String imgurl;
  final String authorname;
  final String datetime;
  final VoidCallback onTap;
  final BookMarkController bookMarkController;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(5),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFW500(
                    fontFamily: 'poppins',
                    text: title,
                    fontSize: 16,
                    textcolor: textColor1,
                    fontWeight: FontWeight.w600,
                  ),
                  sizeH(5),
                  Row(
                    children: [
                      Image.asset(
                        imgurl,
                        height: 24,
                      ),
                      sizeW10(),
                      Expanded(
                        child: TextFW400(
                            text: '$authorname · $datetime',
                            fontSize: 12,
                            textcolor: textColor2),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // sizeW10(),
            Obx(
              () => Row(
                children: [
                  ClipRRect(
                    borderRadius: radius(5),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  sizeW10(),
                  bookMarkController.isShow.value
                      ? IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
