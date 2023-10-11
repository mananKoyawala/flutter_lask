import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isBlank = true.obs;
  var isAuthenticatedUser = false.obs;

  //* User Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final mobileNumber = TextEditingController();
  var visible = true.obs;

  //* OTP
  var phoneNumber = ''.obs;
  var verificationId = ''.obs;
  var currentValue = Rx<String>("");

  changeBlank(bool value) {
    isBlank.value = value;
  }

  changeValueAuth(bool value) {
    isAuthenticatedUser.value = value;
  }

  resetAll() {
    email.clear();
    password.clear();
    mobileNumber.clear();
    phoneNumber.value = '';
    verificationId.value = '';
    currentValue.value = '';
    visible.value = true;
  }

//*OTP Methods
  void chnagePhoneNumber(number) {
    phoneNumber.value = number;
  }

  void changeVerficationId(String id) {
    verificationId.value = id;
  }

  changeValue(String val) {
    currentValue.value = val;
  }

  void changeVisible() {
    visible.toggle();
  }
}
