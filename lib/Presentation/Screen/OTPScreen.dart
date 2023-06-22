import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/OTPController.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/CustomeRightIconButton.dart';
import 'package:lask/Presentation/Screen/SignUpScreen.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/OTP/PinTheme.dart';
import '../../Package/OTP/animation_Enam.dart';
import '../../Package/OTP/pin_feild.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({
    super.key,
  });
  // final String verificationId;
  ScrollController controller = ScrollController();
  StreamController<ErrorAnimationType>? errorController;
  OTPController otpController = Get.find<OTPController>();
  var otp;
  final auth = FirebaseAuth.instance;
  verify() async {
    print('.....${otpController.currentValue.value}');
    final credential = PhoneAuthProvider.credential(
        verificationId: otpController.verificationId.value,
        smsCode: otpController.currentValue.value);

    try {
      await auth
          .signInWithCredential(credential)
          .then((value) =>
              // Navigator.push(
              //     Get.context!, MaterialPageRoute(builder: (_) => SignUpScreen()))
              Get.offAll(SignUpScreen()))
          .then((value) => SharedPreference.saveAuth(true));
    } catch (e) {
      Get.snackbar('Error', 'Wrong OTP');
      SharedPreference.saveAuth(true);
    }
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
                                  text: otpController.phoneNumber.value,
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
                                verify();
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                otpController.changeValue(value);
                                print(otpController.currentValue.value
                                    .toString());
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
