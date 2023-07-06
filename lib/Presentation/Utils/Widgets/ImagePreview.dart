import 'package:flutter/material.dart';
import 'package:lask/Package/Constants.dart';

import '../../Constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jumping_dot/jumping_dot.dart';

Widget imageDialog(path, context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Image Preview',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_rounded),
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
        SizedBox(
          width: DP.dWidth(context, 3),
          height: DP.dHeight(context, 3),
          child: CachedNetworkImage(
            imageUrl: path,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.contain),
                ),
              );
            },
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: Center(
                child: JumpingDots(
                  color: themeColor,
                  radius: 10,
                  numberOfDots: 3,
                  animationDuration: const Duration(milliseconds: 200),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/imageisnotavialable.jpg',
                  fit: BoxFit.contain,
                )),
          ),
        ),
      ],
    ),
  );
}
