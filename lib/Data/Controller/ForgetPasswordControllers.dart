import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var visible1 = true.obs;
  var visible2 = true.obs;
  // var currentValue = Rx<String>("");

  void changeVisible1() {
    visible1.toggle();
  }

  void changeVisible2() {
    visible2.toggle();
  }

  // changeValue(String val) {
  //   currentValue.value = val;
  // }
}
