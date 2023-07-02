// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/OTPController.dart';
import 'package:lask/Presentation/Screen/OTPScreen.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Used fonts SpaceGrotesk for signup and signin or otp screen
class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  OTPController controller = Get.put(OTPController());

  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  validation() {
    if (formKey.currentState!.validate()) {
      //   ScaffoldMessenger.of(Get.context!)
      //       .showSnackBar(SnackBar(content: const Text('Validated')));
      // }
      print('..................${controller.phoneNumber.value}');
      Navigator.push(
          Get.context!, MaterialPageRoute(builder: (_) => OTPScreen()));
      auth.verifyPhoneNumber(
          phoneNumber: '+91${controller.phoneNumber.value}',
          verificationCompleted: (_) {},
          verificationFailed: (e) {
            print('...........${e.toString()}');
          },
          codeSent: (String verificationId, int? token) {
            controller.changeVerficationId(verificationId);
          },
          codeAutoRetrievalTimeout: (e) {
            print('...........${e.toString()}');
          });
    }
    // Navigator.push(
    //     Get.context!, MaterialPageRoute(builder: (_) => OTPScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
        child: SizedBox(
          width: DP.infinity(context),
          child: CP(
            h: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Center(
                  child: TextFW700(
                    text: "Mobile Authentication",
                    fontSize: 28,
                    textcolor: black,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 55),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFW400(
                                text: "Name *", fontSize: 16, textcolor: black),
                            const SizedBox(height: 10),
                            TextFFeild(
                                textInputAction: TextInputAction.done,
                                focus: false,
                                hintText: "Enter Phone Number",
                                mainColor: black,
                                textInputType: TextInputType.phone,
                                obsecureText: false,
                                length: 10,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Phone Number required";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  controller.phoneNumber(val);
                                },
                                borderRadius: 10,
                                border: true,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: blackO_30)),
                          ]),
                    ),
                  ),
                ),
                Visibility(
                    visible: DP.visibility(context),
                    child: Column(
                      children: [
                        CustomButton(
                          onPress: () {
                            validation();
                          },
                          radius: 10,
                          height: 48,
                          width: DP.infinity(context),
                          label: "Next",
                          bgcolor: themeColor,
                          txtcolor: white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
