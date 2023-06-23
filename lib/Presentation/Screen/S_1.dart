import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';

import 'S_2.dart';

class S_1 extends StatefulWidget {
  const S_1({super.key});

  @override
  State<S_1> createState() => _S_1State();
}

class _S_1State extends State<S_1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    next();
  }

  Future<void> next() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    setState(() {
      move();
    });
  }

  move() {
    Get.to(() => S_2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'S_1',
            style: TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
