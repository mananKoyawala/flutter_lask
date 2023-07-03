// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/SceinceController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Constants.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Science extends StatelessWidget {
  Science({
    super.key,
  });

  ScienceController scienceController = Get.put(ScienceController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => scienceController.getData(),
        child: Obx(() {
          if (scienceController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return scienceController.isFirstLoadRunning.value ||
                  scienceController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: scienceController.controller,
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
                        controller: scienceController.controller,
                        itemCount: scienceController.science.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title: scienceController.science[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article: scienceController.science[index]));
                              },
                              imgurl:
                                  scienceController.science[index].urlToImage,
                              authorname:
                                  scienceController.science[index].author,
                              datetime:
                                  scienceController.science[index].publishedAt);
                        },
                      ),
                    ),
                    if (scienceController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
