import 'package:flutter/material.dart';

import '../../../Package/Constants.dart';

class VerticleShimmer extends StatelessWidget {
  const VerticleShimmer({super.key});

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
