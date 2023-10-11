// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/Controller/API/TechnologyController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Constants.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Technology extends StatelessWidget {
  Technology({
    super.key,
  });

  TechnologyController technologyController = Get.put(TechnologyController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => technologyController.getData(),
        child: Obx(() {
          if (technologyController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return technologyController.isFirstLoadRunning.value ||
                  technologyController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: technologyController.controller,
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
                        controller: technologyController.controller,
                        itemCount: technologyController.technology.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title:
                                  technologyController.technology[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article: technologyController
                                        .technology[index]));
                              },
                              imgurl: technologyController
                                  .technology[index].urlToImage,
                              authorname:
                                  technologyController.technology[index].author,
                              datetime: technologyController
                                  .technology[index].publishedAt);
                        },
                      ),
                    ),
                    if (technologyController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
