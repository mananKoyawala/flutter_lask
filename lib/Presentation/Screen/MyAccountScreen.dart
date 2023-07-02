import 'package:flutter/material.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/RippleEffectContainer.dart';
import 'package:lask/Package/ScrollColorRemove.dart';
import 'package:lask/Presentation/Constants.dart';
import '../../Package/CustomePadding.dart';
// ignore_for_file: must_be_immutable

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
        child: CP(
          h: 16,
          child: Column(
            children: [
              sizeH(45),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Nav.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  TextFW600(
                    text: 'My Account',
                    fontSize: 18,
                    textcolor: textColorMain,
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_back,
                        color: white,
                      ))
                ],
              ),
              sizeH25(),
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: scrollController,
                child: Column(
                  children: [
                    AccountItem(
                      title: 'Email Address',
                      subtitle: 'le*******gds@gmail.com',
                      onTap: () {},
                    ),
                    sizeH10(),
                    AccountItem(
                      title: 'Connect Account',
                      subtitle: 'Google, Facebook',
                      onTap: () {},
                    ),
                    sizeH10(),
                    SingleAccountItem(title: 'Account Password', onTap: () {}),
                    sizeH10(),
                    Divider(color: rippleColor),
                    sizeH10(),
                    AccountItem(
                      title: 'Delete Account',
                      subtitle: 'Permanently delete your account.',
                      onTap: () {},
                      color: Colors.red,
                    ),
                  ],
                ),
              )),
              sizeH(16)
            ],
          ),
        ),
      ),
    );
  }
}

class SingleAccountItem extends StatelessWidget {
  const SingleAccountItem({
    super.key,
    required this.title,
    required this.onTap,
    this.vPadd,
    this.hPadd,
  });
  final String title;
  final VoidCallback onTap;
  final double? vPadd;
  final double? hPadd;

  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: CP(
        h: hPadd ?? 10,
        v: vPadd ?? 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFW400(text: title, fontSize: 14, textcolor: textColorMain),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.color,
  });
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: CP(
        h: 10,
        v: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFW400(
                    text: title,
                    fontSize: 14,
                    textcolor: color ?? textColorMain),
                sizeH(5),
                TextFW400(text: subtitle, fontSize: 14, textcolor: textColor2),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
