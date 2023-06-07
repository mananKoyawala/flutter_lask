import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int i) {
    currentIndex.value = i;
  }
}
