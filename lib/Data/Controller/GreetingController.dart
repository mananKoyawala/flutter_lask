import 'package:get/get.dart';

class Greeting extends GetxController {
  var greeting = 'Good Morning'.obs;

  void chnageDate(String string) {
    greeting.value = string;
  }

  void greetingStatus() {
    int date = DateTime.now().hour;
    if (date >= 00 && date < 12) {
      chnageDate('Good Morning');
    } else if (date >= 12 && date < 16) {
      chnageDate('Good Afternoon');
    } else if (date >= 17 && date <= 24) {
      chnageDate('Good Evening');
    }
    // TimeOfDay day = TimeOfDay.now();
    // switch (day.period) {
    //   case DayPeriod.am:
    //     print('its morning');
    //     break;
    //   case DayPeriod.pm:
    //     print('its evening/night');
    // }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    greetingStatus();
  }
}
