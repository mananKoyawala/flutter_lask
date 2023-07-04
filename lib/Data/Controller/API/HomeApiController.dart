import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'NewModel.dart';

class HomeApiController extends GetxController {
  //* Paggination
  // List<ArticleModel> news = [];
  var news = <ArticleModel>[].obs;
  // final baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  ScrollController controller = ScrollController();
  int page = 0;
  final int limit = 30;
  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;
  var isLoadRunning = false.obs;

  //*First Load

  void firstLoad() async {
    // isFirstLoadRunning = true;
    changeisFirstLoadRunning(true);
    print('** First Called');
    try {
      final res = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&page=$page&pageSize=$limit&category=business&apiKey=b6be894833f247f28d166ea1d82f4256'));
      // final List fetchedAlbums = json.decode(res.body);
      print('** First request');
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
              isOffline: false,
              publishedAt: json["publishedAt"],
            );
            news.add(articleModel);
          }
        });
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    changeisFirstLoadRunning(false);
    // isFirstLoadRunning = false;
  }

  //* Load More Data

  void loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print('**Load More Called');
      if (hasNextPage.value == true &&
          isFirstLoadRunning.value == false &&
          isLoadRunning.value == false &&
          controller.position.extentAfter < 10) {
        // isLoadRunning = true;
        changeisLoadRunning(true);
        page += 1; //increase page by 1

        try {
          print('**Request');

          final res = await http.get(Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=in&page=$page&pageSize=$limit&category=business&apiKey=b6be894833f247f28d166ea1d82f4256'));
          // final List fetchedAlbums = json.decode(res.body);

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
                    isOffline: false,
                    publishedAt: json["publishedAt"]);
                news.add(articleModel);
              }
            });
          } else {
            changehasNextPage(false);
            // hasNextPage = false;
          }
        } catch (err) {
          if (kDebugMode) {
            print('Something went Wrong');
          }
        }

        changeisLoadRunning(false);
        // isLoadRunning = false;
      }
    }
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
