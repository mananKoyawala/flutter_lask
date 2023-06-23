import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:get/get.dart';

class S_3 extends StatefulWidget {
  @override
  State<S_3> createState() => _S_3State();
}

class _S_3State extends State<S_3> {
  SharedPreference preference = Get.find<SharedPreference>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preference.set(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text(
            'S_3',
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
