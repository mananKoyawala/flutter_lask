// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lask/Package/Constants.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../Data/Controller/WebViewController.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key, required this.urlToLaunch});
  final String urlToLaunch;

  WebController controller = Get.find<WebController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await controller.controller.canGoBack();
        if (isLastPage) {
          controller.controller.goBack();
          return false;
        }
        controller.resetProgress();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: DP.infinity(context),
            width: DP.infinity(context),
            child: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(urlToLaunch),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    this.controller.controller = controller;
                  },
                  onProgressChanged: (controller, progress) async {
                    this.controller.changeProgress(progress / 100);
                  },
                ),
                Obx(
                  () => controller.progress.value < 1
                      ? LinearProgressIndicator(
                          value: controller.progress.value,
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
