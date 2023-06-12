import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/ForgetPasswordControllers.dart';
import '../../Package/BorderButton.dart';
import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:get/get.dart';

class ForgetPasswordscreen extends StatelessWidget {
  ForgetPasswordController controller = ForgetPasswordController();
  ForgetPasswordscreen({super.key});
  final formKey = GlobalKey<FormState>();
  validation() {
    if (formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(Get.context!)
      //     .showSnackBar(const SnackBar(content: Text("Validated")));
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
                    text: "Change Password",
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
                                text: "Password",
                                fontSize: 16,
                                textcolor: black),
                            const SizedBox(height: 10),
                            Obx(
                              () => TextFFeild(
                                  textInputAction: TextInputAction.next,
                                  focus: false,
                                  maxLines: 1,
                                  hintText: "Enter New Password",
                                  mainColor: black,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.visible1.value,
                                  controller: controller.passwordController,
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
                            const SizedBox(height: 22),
                            TextFW400(
                                text: "Confirm Password",
                                fontSize: 16,
                                textcolor: black),
                            const SizedBox(height: 10),
                            Obx(
                              () => TextFFeild(
                                  focus: false,
                                  hintText: "Enter Confirm Password",
                                  mainColor: black,
                                  maxLines: 1,
                                  textInputType: TextInputType.text,
                                  obsecureText: controller.visible2.value,
                                  controller:
                                      controller.confirmPasswordController,
                                  funValidate: (val) {
                                    if (val != null && val.isEmpty) {
                                      return "Confirm Password required";
                                    } else if (controller
                                            .passwordController.value !=
                                        controller
                                            .confirmPasswordController.value) {
                                      return "Passowrd and Confirm Password must be same!!!";
                                    }
                                    return null;
                                  },
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
                                  borderRadius: 10,
                                  border: true,
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: blackO_30)),
                            ),
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
                          label: "Update Password",
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
