import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/Controller/API/SportsController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Sports extends StatelessWidget {
  const Sports({
    super.key,
    required this.sportsController,
  });

  final SportsController sportsController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => sportsController.getData(),
        child: Obx(
          () => sportsController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
