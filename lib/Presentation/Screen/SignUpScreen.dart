import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Package/BorderButton.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'SignInScreen.dart';

//Used fonts SpaceGrotesk for signup and signin or otp screen
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  validation() {
    if (formKey.currentState!.validate()) {
      // Navigator.of(Get.context!)
      //     .push(MaterialPageRoute(builder: (_) => WelcomeOTPScreen()));
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: const Text('Validated')));
    }
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
                    text: "Sign Up",
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
                                textInputAction: TextInputAction.next,
                                focus: false,
                                hintText: "Enter your Name",
                                mainColor: black,
                                textInputType: TextInputType.text,
                                obsecureText: false,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Name required";
                                  }
                                  return null;
                                },
                                borderRadius: 10,
                                border: true,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: blackO_30)),
                            const SizedBox(height: 22),
                            TextFW400(
                                text: "Email *",
                                fontSize: 16,
                                textcolor: black),
                            const SizedBox(height: 10),
                            TextFFeild(
                                textInputAction: TextInputAction.next,
                                focus: false,
                                hintText: "Enter your Email",
                                mainColor: black,
                                textInputType: TextInputType.emailAddress,
                                obsecureText: false,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Email required";
                                  } else if (val != null &&
                                      !GetUtils.isEmail(val)) {
                                    return "Invalid Email";
                                  }
                                  return null;
                                },
                                borderRadius: 10,
                                border: true,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: blackO_30)),
                            const SizedBox(height: 22),
                            TextFW400(
                                text: "Password *",
                                fontSize: 16,
                                textcolor: black),
                            const SizedBox(height: 10),
                            TextFFeild(
                                focus: false,
                                hintText: "Enter your Password",
                                mainColor: black,
                                textInputType: TextInputType.text,
                                obsecureText: false,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Password required";
                                  } else if (val != null && val.length < 8) {
                                    return "*Must be at least 8 Characters";
                                  }
                                  return null;
                                },
                                borderRadius: 10,
                                border: true,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: blackO_30)),
                            const SizedBox(height: 30),
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
                          label: "CREATE AN ACCOUNT",
                          bgcolor: themeColor,
                          txtcolor: white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextFW700(
                                  text: "Already have an account?",
                                  fontSize: 16),
                              const SizedBox(width: 5),
                              CustomTextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignInScreen()));
                                },
                                textStyle: TextStyles.textStyleW500(
                                  context,
                                  blue,
                                  18,
                                ),
                                title: "Log in",
                              )
                            ],
                          ),
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

class PackageTextFeild extends StatelessWidget {
  const PackageTextFeild(
      {super.key, required this.title, required this.hintTxt});
  final String title;
  final String hintTxt;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFW400(text: title, fontSize: 16, textcolor: black),
        const SizedBox(height: 10),
        TextFFeild(
            focus: false,
            hintText: hintTxt,
            mainColor: black,
            textInputType: TextInputType.text,
            obsecureText: false,
            funValidate: (val) {
              return null;
            },
            borderRadius: 10,
            border: true,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 18, color: blackO_30))
      ],
    );
  }
}
