import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/BusinessController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Business extends StatelessWidget {
  const Business({
    super.key,
    required this.businessController,
  });

  final BusinessController businessController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => businessController.getData(),
        child: Obx(
          () => businessController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
