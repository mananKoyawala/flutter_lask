import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/Controller/API/HealthController.dart';
import '../../../Screen/ArticaleScreen.dart';
import '../AddressItem.dart';

class Health extends StatelessWidget {
  const Health({
    super.key,
    required this.healthController,
  });

  final HealthController healthController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => healthController.getData(),
        child: Obx(
          () => healthController.isFirstLoadRunning.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        // physics: const BouncingScrollPhysics(),
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
                ),
        ),
      ),
    );
  }
}
