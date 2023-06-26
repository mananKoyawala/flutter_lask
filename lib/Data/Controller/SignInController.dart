import 'package:get/get.dart';

class SignInController extends GetxController {
  var isBlank = true.obs;

  changeBlank(bool value) {
    isBlank.value = value;
  }
}
