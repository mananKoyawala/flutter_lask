// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/EntertainmentController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Constants.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Entertainment extends StatelessWidget {
  Entertainment({
    super.key,
  });

  EntertainmentController entertainmentController =
      Get.put(EntertainmentController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => entertainmentController.getData(),
        child: Obx(() {
          if (entertainmentController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return entertainmentController.isFirstLoadRunning.value ||
                  entertainmentController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: entertainmentController.controller,
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
                        controller: entertainmentController.controller,
                        itemCount: entertainmentController.entertainment.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title: entertainmentController
                                  .entertainment[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article: entertainmentController
                                        .entertainment[index]));
                              },
                              imgurl: entertainmentController
                                  .entertainment[index].urlToImage,
                              authorname: entertainmentController
                                  .entertainment[index].author,
                              datetime: entertainmentController
                                  .entertainment[index].publishedAt);
                        },
                      ),
                    ),
                    if (entertainmentController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
