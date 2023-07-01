import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/Controller/API/TechnologyController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Technology extends StatelessWidget {
  const Technology({
    super.key,
    required this.technologyController,
  });

  final TechnologyController technologyController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => technologyController.getData(),
        child: Obx(
          () => technologyController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
