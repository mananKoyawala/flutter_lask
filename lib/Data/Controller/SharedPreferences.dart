import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends GetxController {
  var isVerifed = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //! It is now only for Authentication after Profile created it is mendtory if you loose you have to start from first
  static Future<bool> saveAuth(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool('Auth', value);
  }

  static Future<bool?> retriveAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('Auth');
  }
}
