// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/Controller/API/HealthController.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../Constants.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Health extends StatelessWidget {
  Health({
    super.key,
  });

  HealthController healthController = Get.put(HealthController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => healthController.getData(),
        child: Obx(() {
          if (healthController.status.value == "error") {
            return const Column(
              children: [
                Expanded(
                    child:
                        Center(child: TextFW400(text: 'Error', fontSize: 18))),
              ],
            );
          }
          return healthController.isFirstLoadRunning.value ||
                  healthController.isLoading.value == false
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            controller: healthController.controller,
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
                        controller: healthController.controller,
                        itemCount: healthController.health.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItem(
                              title: healthController.health[index].title,
                              onTap: () {
                                Get.to(() => ArticaleScreen(
                                    article: healthController.health[index]));
                              },
                              imgurl: healthController.health[index].urlToImage,
                              authorname: healthController.health[index].author,
                              datetime:
                                  healthController.health[index].publishedAt);
                        },
                      ),
                    ),
                    if (healthController.isLoadRunning.value == true)
                      const Center(child: CircularProgressIndicator()),
                  ],
                );
        }),
      ),
    );
  }
}
