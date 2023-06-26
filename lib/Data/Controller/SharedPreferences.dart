import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends GetxController {
  var isVerifed = false.obs;
  var isAuthenticated = 0.obs;

  //* User Data For authentication
  var u_email = ''.obs;
  var u_password = ''.obs;
  var u_name = ''.obs;
  var u_mobileNumber = ''.obs;
  int? isAuth;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
    getUserData();
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

  setUserData(
      String email, String password, String name, String mobileNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('u_email', email);
    await prefs.setString('u_password', password);
    await prefs.setString('u_name', name);
    await prefs.setString('u_mobileNumber', mobileNumber);
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    u_email.value = prefs.getString('u_email')!;
    u_password.value = prefs.getString('u_password')!;
    u_name.value = prefs.getString('u_name')!;
    u_mobileNumber.value = prefs.getString('u_mobileNumber')!;
  }
}
