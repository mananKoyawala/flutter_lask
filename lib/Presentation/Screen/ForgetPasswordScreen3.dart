import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/ForgetPasswordControllers.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: must_be_immutable

class ForgetPasswordscreen3 extends StatelessWidget {
  ForgetPasswordscreen3({super.key});
  final formKey = GlobalKey<FormState>();
  SharedPreference pref = Get.find<SharedPreference>();
  final auth = FirebaseAuth.instance;
  ForgetPasswordController controller = Get.find<ForgetPasswordController>();
  updatePassword() {
    if (formKey.currentState!.validate()) {
      controller.updatePassword();
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
                    text: "Create New Password",
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
                                text: "New Password",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.next,
                                  focus: false,
                                  hintText: "Enter Password Here",
                                  mainColor: black,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.pass1.value,
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
                                    onTap: () => controller.changepass1(),
                                    borderRadius: radius(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: controller.pass1.value
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
                                text: "Confirm Password",
                                fontSize: 16,
                                textcolor: black),
                            sizeH10(),
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.done,
                                  focus: false,
                                  hintText: "Re-write Password",
                                  mainColor: black,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.pass2.value,
                                  maxLines: 1,
                                  funValidate: (val) {
                                    if (controller.password.value !=
                                        controller.cppassword.value) {
                                      return 'Password must be Same as Above!!!';
                                    }
                                    return null;
                                  },
                                  suffixIconData: ClickEffect(
                                    onTap: () => controller.changepass2(),
                                    borderRadius: radius(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      height: 40,
                                      child: controller.pass2.value
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  controller: controller.cppassword,
                                  borderRadius: 10,
                                  border: true,
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: blackO_30)),
                            ),
                            sizeH25(),
                          ]),
                    ),
                  ),
                ),
                Visibility(
                    visible: DP.visibility(context),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        CustomButton(
                          onPress: () {
                            updatePassword();
                          },
                          radius: 10,
                          height: 48,
                          width: DP.infinity(context),
                          label: "CHANGE PASSWORD",
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
