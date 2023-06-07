import 'package:flutter/material.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Presentation/Constants.dart';

import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';

class ArticaleScreen extends StatelessWidget {
  ArticaleScreen({super.key});
  ScrollController scrollController = ScrollController();
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
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
                    child: Image.asset(
                      'assets/images/articale1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    margin: const EdgeInsets.only(top: 260),
                    height: 140,
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
                          text: 'See How the Forest is Helping Our World',
                          fontSize: 24,
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
                                text: 'Harry Harper · Apr 12, 2023',
                                fontSize: 12,
                                textcolor: textColor2)
                          ],
                        ),
                      ],
                    ),
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
                            text:
                                "Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world. \nOne of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon sequestration helps to mitigate climate change by reducing the amount of greenhouse gases in the atmosphere. Forests are estimated to absorb approximately 2.4 billion tonnes of carbon dioxide each year, which is equivalent to around 10% of global greenhouse gas emissions. \nForests also play a crucial role in maintaining the water cycle. Trees absorb water from the soil and release it back into the atmosphere through a process known as transpiration. This helps to regulate the local climate and prevents soil erosion and flooding. Forests also act as natural water filters, helping to purify water that flows through them. \nForests are also important sources of biodiversity. They provide habitat for countless species of plants and animals, many of which are found nowhere else on earth. Forests also provide a source of food and medicine for many communities around the world. In fact, it is estimated that around 80% of the world's population relies on traditional medicine derived from plants, many of which are found in forests. \n In addition to their ecological and cultural importance, forests also provide economic benefits. They provide jobs and income for millions of people around the world, particularly in rural areas. Forests also provide timber, paper, and other products that are essential to many industries.",
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
      ),
    );
  }
}
