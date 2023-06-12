import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  var visible = true.obs;
  var currentValue = Rx<String>("");
  TextEditingController textEditingController = TextEditingController();

  void changeVisible() {
    visible.toggle();
  }

  changeValue(String val) {
    currentValue.value = val;
  }
}
