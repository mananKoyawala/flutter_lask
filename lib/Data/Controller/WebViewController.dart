import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebController extends GetxController {
  var progress = 0.0.obs;
  late InAppWebViewController controller;

  void changeProgress(double pro) {
    progress.value = pro;
  }

  resetProgress() {
    progress.value = 0.0;
  }
}
