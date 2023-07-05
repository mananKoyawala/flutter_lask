import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask/Data/Controller/API/NewModel.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';

class BookMarkController extends GetxController {
  var isShow = false.obs;
  SharedPreference pref = Get.find<SharedPreference>();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('lask_news_app');

  void changeStatus() {
    isShow.toggle();
  }

  void reset() {
    isShow.value = false;
  }

  void addArticles(ArticleModel article) async {
    final querySnapshot =
        await ref.where('article', isEqualTo: article.toMap()).get();
    try {
      print('&&&&&&&&&& ${querySnapshot.docs.isEmpty}');
      // if (querySnapshot.docs.isEmpty) {
      ref.doc(pref.u_doc.value).update({
        'article': FieldValue.arrayUnion([article.toMap()]),
      }).then((value) => toast('Article Added'));
    } catch (e) {
      toast('Article Not Added');
    }
  }
}
