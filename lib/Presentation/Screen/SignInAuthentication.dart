import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Data/Controller/SignInController.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
import 'package:lask/Presentation/Screen/SignInScreen.dart';
import '../../Data/Controller/NetworkController.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/OTP/PinTheme.dart';
import '../../Package/OTP/animation_Enam.dart';
import '../../Package/OTP/pin_feild.dart';
import '../../Package/ScrollColorRemove.dart';
import '../Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: must_be_immutable

class SignInAuthentication extends StatelessWidget {
  SignInAuthentication({
    super.key,
    required this.docs,
  });
  ScrollController controller = ScrollController();
  StreamController<ErrorAnimationType>? errorController;
  SignInController signInController = Get.find<SignInController>();
  NetwrokController netwrokController = Get.find<NetwrokController>();

  final QueryDocumentSnapshot<Object?> docs;
  final auth = FirebaseAuth.instance;
  SharedPreference preference = Get.find<SharedPreference>();
  verify() async {
    final credential = PhoneAuthProvider.credential(
        verificationId: signInController.verificationId.value,
        smsCode: signInController.currentValue.value);

    try {
      await auth.signInWithCredential(credential).then((value) {
        //! Write data in SharedPreferences.
        toast("Authentication Successful.");
        signInController.changeValueAuth(true);
        Get.offAll(() => Dashboard());
      });
    } catch (e) {
      toast('Wrong Otp');
      signInController.changeValueAuth(false);
      //! Make mechanism after 1 minute it will be in login screen and all are reset all
    }

    if (signInController.isAuthenticatedUser.value == true) {
      print('*#*##*#**#*##*${docs['email']}');
      print('@#@#@#@#@#@#${preference.u_email.value}');

      preference.setUserData(
          docs['email'], docs['password'], docs['name'], docs['mobilenumber']);
      preference.changeName(
          docs['name'], docs['email'], docs['password'], docs['mobilenumber']);
      signInController.resetAll();
      // preference.getUserData();
      // preference.changeName(docs['name']);
      print('@#@#@#@#@#@#${preference.u_email.value}');
    }
  }

  wrongOTP() async {
    await Future.delayed(const Duration(seconds: 120));
    toast("Account is not Created please try Again...");
    Get.offAll(() => SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizeH25(),
                        sizeH25(),
                        CP(
                          h: 10,
                          child: Icon(
                            Icons.password,
                            size: DP.dHeight(context, 3),
                          ),
                        ),
                        CP(
                          h: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFW500(
                                text: 'Enter Verification Code',
                                fontSize: 20,
                                textcolor: textColor1,
                              ),
                              TextFW500(
                                text: 'We have sent SMS to:',
                                fontFamily: 'poppins',
                                fontSize: 14,
                                textcolor: textColor1,
                              ),
                              Obx(
                                () => TextFW700(
                                  text: signInController.phoneNumber.value,
                                  fontSize: 14,
                                  textcolor: textColor1,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizeH(40),
                        CP(
                          h: 16,
                          child: Column(children: [
                            PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 48,
                                  inactiveColor: Colors.transparent,
                                  selectedColor: Colors.transparent,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  fieldWidth: 48,
                                  activeFillColor: Colors.transparent,
                                  activeColor: Colors.transparent),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [],
                              onCompleted: (v) {
                                if (!netwrokController.noInternet.value) {
                                  verify();
                                } else {
                                  toast('Please check the Internet Connection');
                                }
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                signInController.changeValue(value);
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                return true;
                              },
                            ),
                            sizeH10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextButton(
                                    onPressed: () {},
                                    textStyle: TextStyle(
                                        color: themeColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                    title: 'Resend OTP'),
                                CustomTextButton(
                                    onPressed: () {
                                      Nav.pop(context);
                                    },
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins'),
                                    title: 'Change Phone Number'),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
