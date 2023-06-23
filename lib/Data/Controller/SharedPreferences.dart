import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends GetxController {
  var isVerifed = false.obs;
  var isAuthenticated = 0.obs;
  int? isAuth;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  set(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Auth', value);
  }

  Future<void> get() async {
    int? auth;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth = prefs.getInt('Auth');
    if (auth == null || auth == 0) {
      changeValue(0);
    } else {
      changeValue(1);
    }
    print('*****Auth = ${auth}');
  }

  changeValue(int i) {
    isAuthenticated.value = i;
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
