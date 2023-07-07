import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Package/Constants.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        child: Lottie.asset('assets/json/commingsoon.json',
            height: DP.height(context, 5)),
      ),
    );
  }
}
