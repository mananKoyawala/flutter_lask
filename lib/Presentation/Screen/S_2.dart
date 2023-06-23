import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Screen/MyAccountScreen.dart';
import 'package:lask/Presentation/Screen/S_3.dart';
import 'package:get/get.dart';

class S_2 extends StatelessWidget {
  SharedPreference controller = Get.find<SharedPreference>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'S_2',
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
              onPressed: () => Get.to(S_3()), child: const Text('GO')),
          ElevatedButton(
              onPressed: () {
                controller.isAuthenticated.value == 0
                    ? Get.to(() => MyAccountScreen())
                    : Get.to(() => Dashboard());
              },
              child: const Text('Test'))
        ],
      ),
    );
  }
}
