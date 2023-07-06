import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import '../../../Package/Constants.dart';
import '../../../Package/CustomeTexts.dart';
import '../../../Package/RippleEffectContainer.dart';
import '../../Constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import 'ImagePreview.dart';

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.imgurl,
      required this.authorname,
      required this.datetime});
  final String title;
  final String imgurl;
  final String authorname;
  final String datetime;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(5),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFW500(
                    maxLines: 2,
                    fontFamily: 'poppins',
                    text: title,
                    fontSize: 16,
                    textcolor: textColor1,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
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
                            FittedBox(
                              child: TextFW400(
                                  text: authorname,
                                  fontSize: 12,
                                  textcolor: textColor2),
                            ),
                            TextFW400(
                                text: datetime.substring(0, 10),
                                fontSize: 12,
                                textcolor: textColor2),
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
              child: CachedNetworkImage(
                imageUrl: imgurl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                    height: 80,
                    width: 120,
                  );
                },
                placeholder: (context, url) => Container(
                  height: 80,
                  width: 120,
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
                    height: 80,
                    width: 120,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/imageisnotavialable.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            // ClipRRect(
            //   borderRadius: radius(5),
            //   child: Image.network(
            //     imgurl,
            //     height: 80,
            //     width: 120,
            //     fit: BoxFit.cover,
            //     loadingBuilder: (context, child, loadingProgress) {
            //       if (loadingProgress == null) return child;
            //       return Container(
            //         height: 80,
            //         width: 120,
            //         alignment: Alignment.center,
            //         child: Center(
            //           child: JumpingDots(
            //             color: themeColor,
            //             radius: 10,
            //             numberOfDots: 3,
            //             animationDuration: const Duration(milliseconds: 200),
            //           ),
            //         ),
            //       );
            //     },
            //     errorBuilder: (context, error, stackTrace) {
            //       return Container(
            //         height: 80,
            //         width: 120,
            //         alignment: Alignment.center,
            //         child: Center(
            //           child: Image.asset(
            //               'assets/images/imageisnotavialable.jpg',
            //               fit: BoxFit.cover),
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
