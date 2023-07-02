import 'package:get/get.dart';

class OTPController extends GetxController {
  var visible = true.obs;
  var currentValue = Rx<String>("");
  // TextEditingController textEditingController = TextEditingController();
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

  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   await SharedPreference.retriveAuth() == true
  //       ? Get.offAll(SignUpScreen())
  //       : Get.offAll(AuthenticationScreen());
  // }
}
