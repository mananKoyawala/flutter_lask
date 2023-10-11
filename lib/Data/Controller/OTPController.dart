import 'package:get/get.dart';

class OTPController extends GetxController {
  var visible = true.obs;
  var currentValue = Rx<String>("");
  var verificationId = ''.obs;
  void changeVisible() {
    visible.toggle();
  }

  changeValue(String val) {
    currentValue.value = val;
  }

  //!Auth
  var phoneNumber = ''.obs;

  void chnagePhoneNumber(number) {
    phoneNumber.value = number;
  }

  void changeVerficationId(String id) {
    verificationId.value = id;
  }
}
