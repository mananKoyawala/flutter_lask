// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Presentation/Constants.dart';
import '../../../../Data/Controller/API/SportsController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Sports extends StatelessWidget {
  Sports({
    super.key,
  });

  SportsController sportsController = Get.put(SportsController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => sportsController.getData(),
        child: Obx(() {
          if (sportsController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return sportsController.isFirstLoadRunning.value ||
                  sportsController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: sportsController.controller,
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return getShimmerAddressItems();
                            })),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        controller: sportsController.controller,
                        itemCount: sportsController.sports.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title: sportsController.sports[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article: sportsController.sports[index]));
                              },
                              imgurl: sportsController.sports[index].urlToImage,
                              authorname: sportsController.sports[index].author,
                              datetime:
                                  sportsController.sports[index].publishedAt);
                        },
                      ),
                    ),
                    if (sportsController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
