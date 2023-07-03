import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/API/BusinessController.dart';
import 'package:lask/Data/Controller/API/EntertainmentController.dart';
import 'package:lask/Data/Controller/API/ExploreController.dart';
import 'package:lask/Data/Controller/API/HealthController.dart';
import 'package:lask/Data/Controller/API/SceinceController.dart';
import 'package:lask/Data/Controller/API/SportsController.dart';
import 'package:lask/Data/Controller/API/TechnologyController.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:lask/Presentation/Utils/Widgets/Explore/Business.dart';
import 'package:lask/Presentation/Utils/Widgets/Explore/Entertainment.dart';
import 'package:lask/Presentation/Utils/Widgets/Explore/Health.dart';
import 'package:lask/Presentation/Utils/Widgets/Explore/Science.dart';
import 'package:lask/Presentation/Utils/Widgets/Explore/Technology.dart';
import 'package:get/get.dart';
import '../../Package/CustomePadding.dart';
import 'package:button_tab/button_tab.dart';

import '../Utils/Widgets/Explore/Sports.dart';
// ignore_for_file: must_be_immutable

class ExploreScreen extends StatelessWidget {
  List<String> items = [
    "Sports",
    "Entertainment",
    "Health",
    "Technology",
    "Science",
    "Business",
    "Travel",
    "Political",
  ];
  // SportsController sportsController = Get.put(SportsController());
  // BusinessController businessController = Get.put(BusinessController());
  // HealthController healthController = Get.put(HealthController());
  // TechnologyController technologyController = Get.put(TechnologyController());
  // ScienceController scienceController = Get.put(ScienceController());
  // EntertainmentController entertainmentController =
  //     Get.put(EntertainmentController());
  ExploreScreen({super.key});
  ScrollController scrollController = ScrollController();
  ExploreController exploreController = ExploreController();
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
                    const TextFW600(text: 'Explore', fontSize: 24),
                    IconButton(
                        onPressed: () {
                          // showModalBottomSheet(
                          //     isScrollControlled: true,
                          //     enableDrag: false,
                          //     isDismissible: false,
                          //     shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //             top: Radius.circular(25))),
                          //     context: context,
                          //     builder: (context) => SearchPage());
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
              ),
              sizeH(10),
              // CP(
              //     h: 16,
              //     child: ButtonTab(
              //       items: items,
              //       currentIndex: _currentIndex,
              //     )),
              EasyAnimatedTab(
                buttonTitles: items,
                onSelected: (index) {
                  exploreController.changeIndex(index);
                },
                animationDuration: 500,
                minWidthOfItem: 70,
                minHeightOfItem: 40,
                deActiveItemColor: white,
                activeItemColor: lightblue,
                activeTextStyle: TextStyle(
                    color: black, fontSize: 14, fontWeight: FontWeight.w700),
                deActiveTextStyle: TextStyle(
                    color: black, fontSize: 14, fontWeight: FontWeight.w700),
                activeBorderRadius: 20,
                deActiveBorderRadius: 20,
              ),
              sizeH(20),
              Obx(
                () => showPages(exploreController.currentIndex.value),
              ),
              sizeH(60)
            ],
          ),
        ),
      ),
    );
  }
}

showPages(int index) {
  switch (index) {
    case 0:
      return Sports();
    case 1:
      return Entertainment();
    case 2:
      return Health();
    case 3:
      return Technology();
    case 4:
      return Science();
    case 5:
      return Business();
    case 6:
      return const Text('Travel');
    case 7:
      return const Text('Political');
  }
}
