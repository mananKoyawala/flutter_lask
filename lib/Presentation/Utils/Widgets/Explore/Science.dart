import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/SceinceController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Science extends StatelessWidget {
  const Science({
    super.key,
    required this.scienceController,
  });

  final ScienceController scienceController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => scienceController.getData(),
        child: Obx(
          () => scienceController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
