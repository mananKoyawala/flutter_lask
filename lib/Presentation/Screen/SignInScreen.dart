import 'package:flutter/material.dart';
import 'package:lask/Presentation/Screen/AuthenticationScreen.dart';
import 'package:lask/Presentation/Screen/ForgetPasswordScreen.dart';
import 'package:lask/Presentation/Screen/SignUpScreen.dart';
import '../../Package/BorderButton.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  validation() {
    if (formKey.currentState!.validate()) {
      Get.to(() => AuthenticationScreen());
    }
  }

//! Login screen only using mobile number only
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
                    text: "log in",
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
                                text: "Name", fontSize: 16, textcolor: black),
                            const SizedBox(height: 10),
                            TextFFeild(
                                textInputAction: TextInputAction.next,
                                focus: false,
                                hintText: "Enter your Name",
                                mainColor: black,
                                textInputType: TextInputType.emailAddress,
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
                                text: "Password",
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
                          label: "LOG IN",
                          bgcolor: themeColor,
                          txtcolor: white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFW500(
                                text: 'Forgot password ?',
                                fontSize: 14,
                                textcolor: textColor2),
                            sizeW(5),
                            CustomTextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            ForgetPasswordscreen()));
                              },
                              textStyle: TextStyles.textStyleW500(
                                context,
                                themeColor,
                                16,
                              ),
                              title: "Change Password",

                              //! First authenticate the user after only user can able to chnage the password
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onPress: () {
                            Get.offAll(() => SignUpScreen());
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
