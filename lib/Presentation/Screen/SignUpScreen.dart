import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/SignUpController.dart';
import 'package:lask/Presentation/Screen/SignUpAuthentication.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'SignInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: must_be_immutable

//Used fonts SpaceGrotesk for signup and signin or otp screen
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  SignUpController controller = Get.put(SignUpController());
  final auth = FirebaseAuth.instance;

  validation() async {
    if (formKey.currentState!.validate()) {
      controller.checkUserExist();
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: TextFW500(
          text: 'It Taks Some Time',
          fontSize: 14,
          textcolor: white,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 1500),
      ));
      await Future.delayed(const Duration(seconds: 5));
      if (controller.alreadyExist.value) {
        toast('User Already Exist with provided Email Address');
      } else {
        auth.verifyPhoneNumber(
            phoneNumber: '+91${controller.phoneNumber.value}',
            verificationCompleted: (_) {},
            verificationFailed: (e) {
              // print('...........${e.toString()}');
            },
            codeSent: (String verificationId, int? token) {
              controller.changeVerficationId(verificationId);
            },
            codeAutoRetrievalTimeout: (e) {
              // print('...........${e.toString()}');
            });
        Get.to(() => SignUpAuthentication());
      }
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
                sizeH(70),
                Center(
                  child: TextFW700(
                    text: "Sign Up",
                    fontSize: 28,
                    textcolor: black,
                    textAlign: TextAlign.center,
                  ),
                ),
                sizeH(40),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFW400(
                                text: "Name *", fontSize: 16, textcolor: black),
                            sizeH10(),
                            TextFFeild(
                                textInputAction: TextInputAction.next,
                                focus: false,
                                hintText: "Enter your Name",
                                mainColor: black,
                                textInputType: TextInputType.text,
                                obsecureText: false,
                                controller: controller.name,
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
                            sizeH25(),
                            TextFW400(
                                text: "Email *",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            TextFFeild(
                                textInputAction: TextInputAction.next,
                                focus: false,
                                hintText: "Enter your Email",
                                mainColor: black,
                                textInputType: TextInputType.emailAddress,
                                obsecureText: false,
                                controller: controller.email,
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
                            sizeH25(),
                            TextFW400(
                                text: "Password *",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.next,
                                  focus: false,
                                  hintText: "Enter Password",
                                  mainColor: black,
                                  maxLines: 1,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.visible1.value,
                                  controller: controller.password,
                                  funValidate: (val) {
                                    if (val != null && val.isEmpty) {
                                      return "Password required";
                                    } else if (val != null && val.length < 8) {
                                      return "*Must be at least 8 Characters";
                                    }
                                    return null;
                                  },
                                  suffixIconData: ClickEffect(
                                    onTap: () => controller.changeVisible1(),
                                    borderRadius: radius(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: controller.visible1.value
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  borderRadius: 10,
                                  border: true,
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: blackO_30)),
                            ),
                            sizeH25(),
                            TextFW400(
                                text: "Confirm Password *",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.next,
                                  focus: false,
                                  hintText: "Enter Confirm Password",
                                  mainColor: black,
                                  maxLines: 1,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.visible2.value,
                                  controller: controller.cpassword,
                                  suffixIconData: ClickEffect(
                                    onTap: () => controller.changeVisible2(),
                                    borderRadius: radius(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: controller.visible2.value
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  funValidate: (val) {
                                    if (val != null && val.isEmpty) {
                                      return "Confirm Password required";
                                    } else if (controller.password.value !=
                                        controller.cpassword.value) {
                                      return "Password and Confitm Password should be same";
                                    }
                                    return null;
                                  },
                                  borderRadius: 10,
                                  border: true,
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: blackO_30)),
                            ),
                            sizeH25(),
                            TextFW400(
                                text: "Mobile Number *",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            TextFFeild(
                                textInputAction: TextInputAction.done,
                                focus: false,
                                hintText: "Enter Correct Mobile Number",
                                mainColor: black,
                                textInputType: TextInputType.number,
                                obsecureText: false,
                                controller: controller.mobileNumber,
                                length: 10,
                                funValidate: (val) {
                                  if (val != null && val.isEmpty) {
                                    return "Phone Number required";
                                  } else if (val != null && val.length != 10) {
                                    return "Mobile Number should be 10 of digits.";
                                  }

                                  return null;
                                },
                                onChanged: (val) {
                                  controller.chnagePhoneNumber(val);
                                },
                                borderRadius: 10,
                                border: true,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: blackO_30)),
                            sizeH(30),
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
                                  Get.offAll(() => SignInScreen());
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
