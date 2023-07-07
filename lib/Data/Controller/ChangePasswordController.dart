import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Presentation/Screen/MyAccountScreen.dart';

class ChangePasswordController extends GetxController {
  final password = TextEditingController();
  final cppassword = TextEditingController();
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('lask_news_app');
  SharedPreference pref = Get.find<SharedPreference>();
  var pass1 = true.obs;
  var pass2 = true.obs;

  void changepass1() {
    pass1.toggle();
  }

  void changepass2() {
    pass2.toggle();
  }

  resetAll() {
    pass1.value = true;
    pass2.value = true;
    password.clear();
    cppassword.clear();
  }

  updatePassword() async {
    ref.doc(pref.u_doc.value).update({'password': password.text}).then((value) {
      toast('Password Updated');
      Get.to(() => MyAccountScreen());
    }).catchError((error) => toast('Error Occur is => $error'));
  }
}
