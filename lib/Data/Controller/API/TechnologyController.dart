import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lask/Data/Controller/API/ApiConstants.dart';

import 'NewModel.dart';

class TechnologyController extends GetxController {
  var currentIndex = 0.obs;
  var status = "ok".obs;

  void changeIndex(int value) {
    currentIndex.value = value;
  }

  var isLoading = false.obs;

  //* Paggination
  var technology = <ArticleModel>[].obs;
  ScrollController controller = ScrollController();
  int page = 0;
  final int limit = 10;
  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;
  var isLoadRunning = false.obs;

  //*First Load

  void firstLoad() async {
    changeisFirstLoadRunning(true);
    try {
      final res = await http
          .get(Uri.parse('$technologyUrl&page=$page&pageSize=$limit$apiKey'));
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
                publishedAt: json["publishedAt"]);
            technology.add(articleModel);
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
          final res = await http.get(
              Uri.parse('$technologyUrl&page=$page&pageSize=$limit$apiKey'));

          var jsonData = jsonDecode(res.body);
          if (jsonData['status'] == "ok" && jsonData.isNotEmpty) {
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
                    publishedAt: json["publishedAt"]);
                technology.add(articleModel);
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
    changeLoading(false);

    page = 0;
    technology.clear();
    changeisFirstLoadRunning(false);
    changehasNextPage(true);
    changeisLoadRunning(false);
    await Future.delayed(const Duration(milliseconds: 1500));
    changeLoading(true);
    firstLoad();
    controller = ScrollController()..addListener(loadMore);
  }

  //* onInit

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    changeLoading(true);
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

  changeLoading(bool value) {
    isLoading.value = value;
  }

  changeStatus(String status) {
    this.status.value = status;
  }
}
