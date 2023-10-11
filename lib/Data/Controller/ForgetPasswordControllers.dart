import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Presentation/Screen/SignInScreen.dart';

import '../../Presentation/Screen/ForgetPasswordScreen2.dart';

class ForgetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final password = TextEditingController();
  final cppassword = TextEditingController();
  CollectionReference ref =
      FirebaseFirestore.instance.collection('lask_news_app');
  final auth = FirebaseAuth.instance;

  final mobileNumber = TextEditingController();
  var visible1 = true.obs;
  var visible2 = true.obs;
  var isExist = false.obs;
  // var currentValue = Rx<String>("");

  void changeVisible1() {
    visible1.toggle();
  }

  void changeVisible2() {
    visible2.toggle();
  }

  var pass1 = true.obs;
  var pass2 = true.obs;

  void changepass1() {
    pass1.toggle();
  }

  void changepass2() {
    pass2.toggle();
  }

  //* OTP STUFF
  var verificationId = ''.obs;
  var currentOTP = ''.obs;
  var phoneNumber = ''.obs;
  void changeOTP(String val) {
    currentOTP.value = val;
  }

  void changeVerificationId(String val) {
    verificationId.value = val;
  }

  void checkUserExist() async {
    final querySnapshot =
        await ref.where('mobilenumber', isEqualTo: mobileNumber.text).get();
    // const Center(child: CircularProgressIndicator());
    await Future.delayed(const Duration(microseconds: 2500));
    if (querySnapshot.docs.isNotEmpty) {
      auth.verifyPhoneNumber(
          phoneNumber: '+91${mobileNumber.text}',
          verificationCompleted: (_) {},
          verificationFailed: (e) {
            // print('...........${e.toString()}');
          },
          codeSent: (String verificationId, int? token) {
            changeVerificationId(verificationId);
          },
          codeAutoRetrievalTimeout: (e) {
            // print('...........${e.toString()}');
          });
      Get.offAll(() => ForgetPasswordscreen2());
    } else {
      toast("Can't Find account with Provided Mobile Number!!!");
    }
  }

  changeisExist(bool val) {
    isExist.value = val;
  }

  changeNumber(String val) {
    phoneNumber.value = val;
  }

  updatePassword() async {
    final querySnapshot =
        await ref.where('mobilenumber', isEqualTo: mobileNumber.text).get();
    querySnapshot.docs.forEach((doc) {
      change(doc.id);
    });
  }

  change(String id) {
    ref.doc(id).update({'password': password.text}).then((value) {
      toast('Password Changed');
      Get.to(() => SignInScreen());
    }).catchError((error) => toast('Error Occur is => $error'));
  }
}
