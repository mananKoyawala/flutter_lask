import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';

class EditProfileController extends GetxController {
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('lask_news_app');
  final formKey = GlobalKey<FormState>();
  SharedPreference pref = Get.find<SharedPreference>();

  var nameText = ''.obs;
  var emailText = ''.obs;
  var mobileText = ''.obs;

  Future<void> updateDetails(String id) {
    return reference
        .doc(id)
        .update({
          'name': nameText.value,
          'email': emailText.value,
          'mobilenumber': mobileText.value
        })
        .then((value) => toast('Profile Details Updated.'))
        .then((value) => Nav.pop(Get.context!))
        .then((value) =>
            pref.setOnlyData(emailText.value, nameText.value, mobileText.value))
        .then((value) => pref.getUserData())
        .then((value) => resetAll());
  }

  void resetAll() {
    nameText.value = '';
    emailText.value = '';
    mobileText.value = '';
  }

  changeName(String val) {
    nameText.value = val;
  }

  changeEmail(String val) {
    emailText.value = val;
  }

  changeMobile(String val) {
    mobileText.value = val;
  }
}
