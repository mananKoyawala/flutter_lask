// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpController extends GetxController {
  // Reference ref = FirebaseStorage.instance.ref().child('profilePicture.png');

  final CollectionReference reference =
      FirebaseFirestore.instance.collection('lask_news_app');

  //* Controllers
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final mobileNumber = TextEditingController();
  var visible1 = true.obs;
  var visible2 = true.obs;
  var alreadyExist = false.obs;

  //* OTP
  var phoneNumber = ''.obs;
  var verificationId = ''.obs;
  var currentValue = Rx<String>("");

  //* User Signin -> Data
  addData() async {
    //* Check that user already registred or not by email & mobilenumber -> show user already exist
    //* Also Authenticate the email address

    await reference.add({
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'mobilenumber': mobileNumber.text,
      'time': DateTime.now(),
    }).then((value) => print('Data Uploaded'));
  }

  void chnagePhoneNumber(number) {
    phoneNumber.value = number;
  }

  void changeVerficationId(String id) {
    verificationId.value = id;
  }

  changeValue(String val) {
    currentValue.value = val;
  }

  resetAll() {
    name.clear();
    email.clear();
    password.clear();
    cpassword.clear();
    mobileNumber.clear();
    phoneNumber.value = '';
    verificationId.value = '';
    currentValue.value = '';
    visible1.value = true;
    visible2.value = true;
  }

  void changeVisible1() {
    visible1.toggle();
  }

  void changeVisible2() {
    visible2.toggle();
  }

  void changeAlreadyExist(bool val) {
    alreadyExist.value = val;
  }

  void checkUserExist() async {
    final querySnapshot =
        await reference.where('email', isEqualTo: email.text).get();

    if (querySnapshot.docs.isNotEmpty) {
      changeAlreadyExist(true);
    } else {
      changeAlreadyExist(false);
    }
  }
}
