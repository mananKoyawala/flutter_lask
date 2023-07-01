import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/ApiConstants.dart';

import 'NewModel.dart';

class BusinessController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int value) {
    currentIndex.value = value;
  }

  //* Paggination
  var business = <ArticleModel>[].obs;
  ScrollController controller = ScrollController();
  int page = 0;
  final int limit = 30;
  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;
  var isLoadRunning = false.obs;

  //*First Load

  void firstLoad() async {
    changeisFirstLoadRunning(true);
    try {
      final res = await http
          .get(Uri.parse('$businessUrl&page=$page&pageSize=$limit$apiKey'));
      var jsonData = jsonDecode(res.body);
      if (jsonData['status'] == "ok") {
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
                publishedAt: json["publishedAt"]);
            business.add(articleModel);
          }
        });
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    changeisFirstLoadRunning(false);
  }

  //* Load More Data

  void loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (hasNextPage.value == true &&
          isFirstLoadRunning.value == false &&
          isLoadRunning.value == false &&
          controller.position.extentAfter < 10) {
        changeisLoadRunning(true);
        page += 1;

        try {
          final res = await http
              .get(Uri.parse('$businessUrl&page=$page&pageSize=$limit$apiKey'));

          var jsonData = jsonDecode(res.body);
          if (jsonData['status'] == "ok" && jsonData.isNotEmpty) {
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
                    publishedAt: json["publishedAt"]);
                business.add(articleModel);
              }
            });
          } else {
            changehasNextPage(false);
          }
        } catch (err) {
          if (kDebugMode) {
            print('Something went Wrong');
          }
        }

        changeisLoadRunning(false);
      }
    }
  }

  Future getData() async {
    page = 0;
    business.clear();
    changeisFirstLoadRunning(false);
    changehasNextPage(true);
    changeisLoadRunning(false);
    firstLoad();
    controller = ScrollController()..addListener(loadMore);
  }

  //* onInit

  @override
  void onInit() {
    super.onInit();
    firstLoad();
    controller = ScrollController()..addListener(loadMore);
  }

  //* Variable Changes

  void changeisFirstLoadRunning(bool value) {
    isFirstLoadRunning.value = value;
  }

  void changeisLoadRunning(bool value) {
    isLoadRunning.value = value;
  }

  void changehasNextPage(bool value) {
    hasNextPage.value = value;
  }
}
