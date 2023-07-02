import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Package/Constants.dart';

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
      child: const Child());
}

class Child extends StatelessWidget {
  const Child({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      color: white,
                    ),
                    sizeH(5),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/person1.png',
                          height: 24,
                        ),
                        sizeW10(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15,
                                color: white,
                              ),
                              sizeH(5),
                              Container(
                                height: 15,
                                color: white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              sizeW10(),
              ClipRRect(
                borderRadius: radius(5),
                child: Container(
                  height: 80,
                  width: 120,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
