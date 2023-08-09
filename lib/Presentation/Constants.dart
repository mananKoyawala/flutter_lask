import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Data/Controller/API/HomeController.dart';
import '../Package/Constants.dart';
import 'Utils/Widgets/VerticalShimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

Color themeColor = const Color(0xFF2D5BD0);
Color blue = const Color(0xFF0E0AB1);
Color lightblue = const Color(0xFFE9EEFA);
MaterialColor materialThemeColor = createMaterialColor(themeColor);

Color textColorMain = const Color(0xFF231F20);
Color textColor2 = const Color(0xFF6D6265);
Color textColor3 = const Color(0xFF47363A);
Color textColor4 = const Color(0xFF8A8184);
Color background1 = const Color(0xFFE9EEFA).withOpacity(.1);
Color navBG = const Color(0xFFFCE9EE).withOpacity(.7);

Shimmer getShimmerAddressItems() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const VerticleShimmer());
}

Widget horizontalShimmer() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
      return getGeneralShimmer();
    },
  );
}

Shimmer getGeneralShimmer() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const HorizontalShimmer());
}

class HorizontalShimmer extends StatelessWidget {
  const HorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: radius(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: 230,
                decoration:
                    BoxDecoration(borderRadius: radius(10), color: white),
              ),
              sizeH(20),
              SizedBox(
                width: 230,
                height: 50,
                child: Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: radius(5), color: white),
                ),
              ),
              sizeH10(),
              Container(
                height: 20,
                width: 230,
                decoration:
                    BoxDecoration(borderRadius: radius(5), color: white),
              ),
            ],
          ),
        ),
        sizeW(20)
      ],
    );
  }
}

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: DP.height(context, 5),
        child: Lottie.asset('assets/json/nointernet.json'),
      ),
    );
  }
}
