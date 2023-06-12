import 'package:flutter/material.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/RippleEffectContainer.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:lask/Presentation/Utils/Widgets/SearchPage.dart';

import '../../Package/ButtonTab.dart';
import '../../Package/CustomePadding.dart';

class BookmarkedScreen extends StatelessWidget {
  BookmarkedScreen({super.key});
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
                    const TextFW600(text: 'Bookmark', fontSize: 24),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          color: textColorMain,
                        ))
                  ],
                ),
              ),
              sizeH(10),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      controller: scrollController,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AddressItem(
                            title:
                                "Experience the Serenity of Japan's Traditional Countryside",
                            onTap: () {},
                            imgurl: 'assets/images/person1.png',
                            authorname: 'Harry Harper',
                            datetime: 'Apr 12, 2023');
                      },
                    ),
                  ],
                ),
              )),
              sizeH(16)
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
      required this.datetime});
  final String title;
  final String imgurl;
  final String authorname;
  final String datetime;
  final VoidCallback onTap;
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
            ClipRRect(
              borderRadius: radius(5),
              child: Image.asset(
                'assets/images/img1.png',
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
