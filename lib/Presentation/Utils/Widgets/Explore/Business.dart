// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/BusinessController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Constants.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Business extends StatelessWidget {
  Business({
    super.key,
  });

  BusinessController businessController = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => businessController.getData(),
        child: Obx(() {
          if (businessController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return businessController.isFirstLoadRunning.value ||
                  businessController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: businessController.controller,
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
                        controller: businessController.controller,
                        itemCount: businessController.business.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title: businessController.business[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article:
                                        businessController.business[index]));
                              },
                              imgurl:
                                  businessController.business[index].urlToImage,
                              authorname:
                                  businessController.business[index].author,
                              datetime: businessController
                                  .business[index].publishedAt);
                        },
                      ),
                    ),
                    if (businessController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
