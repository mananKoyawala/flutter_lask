import 'package:get/get.dart';

class BookMarkController extends GetxController {
  var isShow = false.obs;

  void changeStatus() {
    isShow.toggle();
  }

  void reset() {
    isShow.value = false;
  }
}
