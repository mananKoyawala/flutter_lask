import 'package:flutter/material.dart';

import '../../../Package/Constants.dart';
import '../../../Package/CustomeTexts.dart';
import '../../../Package/RippleEffectContainer.dart';
import '../../Constants.dart';

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
                            TextFW400(
                                text: authorname,
                                fontSize: 12,
                                textcolor: textColor2),
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
            // sizeW10(),
            ClipRRect(
              borderRadius: radius(5),
              child: Image.network(
                imgurl,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
