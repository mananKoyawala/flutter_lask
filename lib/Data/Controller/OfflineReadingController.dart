import 'package:get/get.dart';
import 'package:lask/Data/Controller/DataBaseHelper.dart';

import '../../Package/Constants.dart';

class OfflineReadingController extends GetxController {
  SQLHelper helper = SQLHelper();
  var articles = <Map<String, dynamic>>[].obs;

  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getArticles();
  }

  getArticles() async {
    final data = await SQLHelper.getItems();

    articles.addAll(data);
    changeLoading(false);
  }

  void changeLoading(bool value) {
    isLoading.value = value;
  }

  deleteArticle(String title, String content) async {
    var flag = await SQLHelper.deleteItem(title, content);
    if (flag) {
      articles.clear();
      final data = await SQLHelper.getItems();
      articles.addAll(data);
      toast('Article Deleted');
      Nav.pop(Get.context!);
    } else {
      toast('Error in Delete Item!!!');
    }
  }
}
