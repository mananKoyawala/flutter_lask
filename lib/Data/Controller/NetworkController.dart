import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lask/Package/CustomeTexts.dart';

class NetwrokController extends GetxController {
  final Connectivity connectivity = Connectivity();
  var noInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  void updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      changeNoInternet(true);
    } else {
      changeNoInternet(false);
    }
  }

  void changeNoInternet(bool value) {
    noInternet.value = value;
  }
}
