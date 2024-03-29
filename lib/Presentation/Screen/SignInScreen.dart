import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Presentation/Screen/ForgetPasswordScreen1.dart';
import 'package:lask/Presentation/Screen/SignInAuthentication.dart';
import 'package:lask/Presentation/Screen/SignUpScreen.dart';
import '../../Data/Controller/NetworkController.dart';
import '../../Data/Controller/SignInController.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: must_be_immutable

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('lask_news_app');
  SignInController controller = Get.put(SignInController());
  SharedPreference pref = Get.find<SharedPreference>();
  NetwrokController netwrokController = Get.find<NetwrokController>();

  final auth = FirebaseAuth.instance;

  validation() {
    if (formKey.currentState!.validate()) {
      // Get.to(() => AuthenticationScreen());
      if (!netwrokController.noInternet.value) {
        checkUserExist();
      } else {
        toast('Please Check your Internet Connection');
      }
    }
  }

  // login() async {
  //   final querySnapshot = await reference
  //       .where('email', isEqualTo: controller.email.text)
  //       .where('password', isEqualTo: controller.password.text)
  //       .where('mobilenumber', isEqualTo: controller.mobileNumber.text)
  //       .get();
  //   // print(
  //   // '******** email = ${controller.email.text} && password = ${controller.password.text}');
  //   if (querySnapshot.docs.isNotEmpty) {
  //     print('######Data Recievd');
  //     querySnapshot.docs.forEach((docs) {
  //       print('Document ID = ${docs.id}');
  //       pref.chnageDoc(docs.id);
  //       print('Pref Document ID = ${pref.u_doc.value}');

  //       print(docs['email']);
  //       print('User doc is = ${pref.u_doc}');
  //       pref.setUserDoc(docs.id);
  //       print('User doc is = ${pref.u_doc}');
  //       auth.verifyPhoneNumber(
  //           phoneNumber: '+91${controller.phoneNumber.value}',
  //           verificationCompleted: (_) {},
  //           verificationFailed: (e) {
  //             // print('...........${e.toString()}');
  //           },
  //           codeSent: (String verificationId, int? token) {
  //             controller.changeVerficationId(verificationId);
  //           },
  //           codeAutoRetrievalTimeout: (e) {
  //             // print('...........${e.toString()}');
  //           });
  //       Get.to(() => SignInAuthentication(docs: docs));
  //     });
  //   } else {
  //     toast('User Not Exist');
  //   }
  // }

  checkUserExist() async {
    final querySnapshot = await reference
        .where('mobilenumber', isEqualTo: controller.mobileNumber.text)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      login();
    } else {
      toast("Can't Find User with given Mobile Number");
    }
  }

  login() async {
    final querySnapshot = await reference
        .where('email', isEqualTo: controller.email.text)
        .where('password', isEqualTo: controller.password.text)
        .where('mobilenumber', isEqualTo: controller.mobileNumber.text)
        .get();
    // print(
    // '******** email = ${controller.email.text} && password = ${controller.password.text}');
    if (querySnapshot.docs.isNotEmpty) {
      print('######Data Recievd');
      querySnapshot.docs.forEach((docs) {
        print('Document ID = ${docs.id}');
        pref.chnageDoc(docs.id);
        print('Pref Document ID = ${pref.u_doc.value}');

        print(docs['email']);
        print('User doc is = ${pref.u_doc}');
        pref.setUserDoc(docs.id);
        print('User doc is = ${pref.u_doc}');
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
        toast("We send you OTP");
        Get.to(() => SignInAuthentication(docs: docs));
      });
    } else {
      toast('Email or Password is Wrong!');
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
                                text: "Email", fontSize: 16, textcolor: black),
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
                                    return "Enter Valid Email address";
                                  }
                                  return null;
                                },
                                controller: controller.email,
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
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.next,
                                  focus: false,
                                  hintText: "Enter your Password",
                                  mainColor: black,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.visible.value,
                                  maxLines: 1,
                                  funValidate: (val) {
                                    if (val != null && val.isEmpty) {
                                      return "Password required";
                                    } else if (val != null && val.length < 8) {
                                      return "*Must be at least 8 Characters";
                                    }
                                    return null;
                                  },
                                  suffixIconData: ClickEffect(
                                    onTap: () => controller.changeVisible(),
                                    borderRadius: radius(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: controller.visible.value
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  controller: controller.password,
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
                                            ForgetPasswordscreen1()));
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
                            Get.to(() => SignUpScreen());
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
