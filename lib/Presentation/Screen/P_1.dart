import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/SignInController.dart';
import 'package:lask/Presentation/Screen/AuthenticationScreen.dart';
import 'package:lask/Presentation/Screen/Dashboard.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class P_1 extends StatelessWidget {
  P_1({super.key});
  final formKey = GlobalKey<FormState>();
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('lask_news_app');
  SignInController controller = SignInController();
  validation() {
    if (formKey.currentState!.validate()) {
      login();
    }
  }

  var isexist;
  // lateuture<QuerySnapshot<Object?>> querySnapshot;
  login() async {
    final querySnapshot = await reference
        .where('email', isEqualTo: email.text)
        .where('password', isEqualTo: password.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      print('######Data Recievd');
      querySnapshot.docs.forEach((element) {
        print(element['email']);
      });
    } else {
      toast('User Not Exist');
    }
  }

  final email = TextEditingController();
  final password = TextEditingController();

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
                                  }
                                  return null;
                                },
                                controller: email,
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
                                controller: password,
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
