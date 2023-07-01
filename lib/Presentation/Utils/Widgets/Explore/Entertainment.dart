import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/EntertainmentController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Entertainment extends StatelessWidget {
  const Entertainment({
    super.key,
    required this.entertainmentController,
  });

  final EntertainmentController entertainmentController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => entertainmentController.getData(),
        child: Obx(
          () => entertainmentController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
