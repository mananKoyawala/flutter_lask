// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  int page = 1; //numbers of pages
  final int limit = 20; //How much data will be received
  bool isFirstLoadRunning = false; //first time loading the data
  bool hasNextPage = true; //indicates that more data has in server to load
  bool isLoadRunning = false; // indicates the request in process

  // String url =
  //     "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc";

  String sample =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&pageSize=10&page=1&apiKey=YOUR_API_KEY";
  Future<void> firstLoad() async {
    print('** fisrt Loading $isFirstLoadRunning');
    isFirstLoadRunning = true;

    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=in&page=$page&pageSize=$limit&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc"));
      // var response = await http.get(Uri.parse(
      //     '$url?country=in&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc'));
      var jsonData = jsonDecode(response.body);
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
            news.add(articleModel);
          }
        });
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    isFirstLoadRunning = false;
    print('** fisrt Loading $isFirstLoadRunning');
  }

  // Future<void> getNews() async {
  //   //* Pagination

  //   // var response = await http.get(Uri.parse(url));
  //   var response = await http.get(Uri.parse(url));
  //   var jsonData = jsonDecode(response.body);

  //   if (jsonData['status'] == "ok") {
  //     jsonData["articles"].forEach((json) {
  //       if (json["urlToImage"] != null &&
  //           json["description"] != null &&
  //           json["author"] != null &&
  //           json["title"] != null &&
  //           json["content"] != null &&
  //           json["url"] != null &&
  //           json["publishedAt"] != null) {
  //         ArticleModel articleModel = ArticleModel(
  //             author: json["author"],
  //             title: json["title"],
  //             description: json["description"],
  //             url: json["url"],
  //             urlToImage: json["urlToImage"],
  //             content: json["content"],
  //             publishedAt: json["publishedAt"]);
  //         news.add(articleModel);
  //       }
  //     });
  //   }
  // }
}

class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;
  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });
}
