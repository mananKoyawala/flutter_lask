import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask/Data/Controller/API/NewModel.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';
import 'package:lask/Package/Constants.dart';

class BookMarkController extends GetxController {
  var isShow = false.obs;
  var isExist = false.obs;
  SharedPreference pref = Get.find<SharedPreference>();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('lask_news_app');

  void changeStatus() {
    isShow.toggle();
  }

  void reset() {
    isShow.value = false;
  }

  void changeIsExist(bool value) {
    isExist.value = value;
  }

  void resteExist() {
    isExist.value = false;
  }

  void addArticles(ArticleModel article) async {
    getData(article);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (isExist.value) {
      toast('Article already Bokkmarked.');
    } else {
      try {
        ref.doc(pref.u_doc.value).update({
          'article': FieldValue.arrayUnion([article.toMap()]),
        }).then((value) => toast('Article Bookmarked.'));
      } catch (e) {
        toast('Error to bookmark article.');
      }
    }
    resteExist();
  }

  void getData(ArticleModel articles) async {
    final querySnapshot = await ref
        .where('email', isEqualTo: pref.u_email.value)
        .where('mobilenumber', isEqualTo: pref.u_mobileNumber.value)
        .get();

    querySnapshot.docs.forEach((docs) {
      // print('@@@@@@@@@@ ${docs['article']}');
      // print('********** ${docs.get('article')}');
      for (int i = 0; i < docs['article'].length; i++) {
        if (docs['article'][i]['title'] == articles.title) {
          // print('*********Article already Bokkmarked.');
          changeIsExist(true);
          break;
        }
        changeIsExist(false);
        // print('Not');
      }
    });
  }
}
