import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/ApiConstants.dart';

import '../NetworkController.dart';
import 'NewModel.dart';

class HomeController extends GetxController {
  var status = "ok".obs;
  NetwrokController netwrokControler = Get.find<NetwrokController>();
  // var isApiCalled = false.obs;
  var isLoading = true.obs;
  var list1 = <ArticleModel>[].obs;
  var list2 = <ArticleModel>[].obs;
  var list3 = <ArticleModel>[].obs;
  var list4 = <ArticleModel>[].obs;
  // var list5 = <ArticleModel>[].obs;

  //* Paggination
  var general = <ArticleModel>[].obs;
  ScrollController controller = ScrollController();
  int page = 0;
  final int limit = 100;

  //*First Load

  void firstLoad() async {
    changeLoading(true);
    resetAllList();
    try {
      final res = await http
          .get(Uri.parse('$generalUrl&page=$page&pageSize=$limit$apiKey'));
      var jsonData = jsonDecode(res.body);

      if (jsonData['status'] == "ok") {
        changeStatus("ok");

        jsonData["articles"].forEach((json) {
          if (json["urlToImage"] != null &&
              json["description"] != null &&
              json["author"] != null &&
              json["title"] != null &&
              json["content"] != null &&
              json["url"] != null &&
              json["publishedAt"] != null) {
            ArticleModel articleModel = ArticleModel(
              author: json["author"],
              title: json["title"],
              description: json["description"],
              url: json["url"],
              urlToImage: json["urlToImage"],
              content: json["content"],
              publishedAt: json["publishedAt"],
              isOffline: false,
            );
            general.add(articleModel);
            if (general.length == 20) {
              splitList();
            }
          }
        });
      } else {
        changeStatus("error");
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    print('*************${general.length}');
    if (general.length == 10) {
      splitList();
    }
    await Future.delayed(const Duration(milliseconds: 1500));
    changeLoading(false);
  }

  //* onInit

  @override
  void onInit() {
    super.onInit();
    // changeApiCalled(true);
    if (netwrokControler.noInternet.value == false) {
      loadData();
    }
    // .then((value) => changeApiCalled(false));
  }

  Future<void> loadData() async {
    print('**********Called the API');
    await Future.delayed(const Duration(milliseconds: 1500));
    changeLoading(true);
    firstLoad();
  }

  changeLoading(bool value) {
    isLoading.value = value;
  }

  changeStatus(String status) {
    this.status.value = status;
  }

  splitList() {
    list1.addAll(general.sublist(0, 5));
    list2.addAll(general.sublist(5, 10));
    list3.addAll(general.sublist(10, 15));
    list4.addAll(general.sublist(15, 20));
    // list5.addAll(general.sublist(20, 25));
  }

  resetAllList() {
    list1.clear();
    list2.clear();
    list3.clear();
    list4.clear();
    // list5.clear();
  }

  // changeApiCalled(bool value) {
  //   isApiCalled.value = value;
  // }
}
