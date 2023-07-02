import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/API/HomeApiController.dart';
// import 'Data/Controller/API/NewModel.dart';
import 'package:get/get.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  HomeApiController controller = Get.put(HomeApiController());
  // List<ArticleModel> news = [];
  // final baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // int page = 0; //numbers of pages
  // final int limit = 30; //How much data will be received
  // bool isFirstLoadRunning = false; //first time loading the data
  // bool hasNextPage = true; //indicates that more data has in server to load
  // bool isLoadRunning = false; // indicates the request in process

  // void loadMore() async {
  //   if (hasNextPage == true &&
  //       isFirstLoadRunning == false &&
  //       isLoadRunning == false &&
  //       controller.position.extentAfter < 300) {
  //     setState(() {
  //       isLoadRunning = true; //Display Progrees indicator that data is fetching
  //     });

  //     page += 1; //increase page by 1

  //     try {
  //       var response = await http.get(Uri.parse(
  //           "https://newsapi.org/v2/top-headlines?country=in&page=$page&pageSize=$limit&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc"));
  //       // var response = await http.get(Uri.parse(
  //       //     '$url?country=in&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc'));
  //       var jsonData = jsonDecode(response.body);

  //       if (jsonData.isNotEmpty) {
  //         if (jsonData['status'] == "ok") {
  //           jsonData["articles"].forEach((json) {
  //             if (json["urlToImage"] != null &&
  //                 json["description"] != null &&
  //                 json["author"] != null &&
  //                 json["title"] != null &&
  //                 json["content"] != null &&
  //                 json["url"] != null &&
  //                 json["publishedAt"] != null) {
  //               ArticleModel articleModel = ArticleModel(
  //                   author: json["author"],
  //                   title: json["title"],
  //                   description: json["description"],
  //                   url: json["url"],
  //                   urlToImage: json["urlToImage"],
  //                   content: json["content"],
  //                   publishedAt: json["publishedAt"]);
  //               setState(() {
  //                 news.add(articleModel);
  //               });
  //             }
  //           });
  //         }
  //       } else {
  //         setState(() {
  //           hasNextPage = false;
  //         });
  //       }
  //     } catch (err) {
  //       if (kDebugMode) {
  //         print('Something went Wrong');
  //       }
  //     }

  //     setState(() {
  //       isLoadRunning = false; // after date fetching it is false
  //     });
  //   }
  // }

  // void firstLoad() async {
  //   //Called only first timw
  //   setState(() {
  //     isFirstLoadRunning = true;
  //   });

  //   try {
  //     var response = await http.get(Uri.parse(
  //         "https://newsapi.org/v2/top-headlines?country=in&page=$page&pageSize=$limit&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc"));
  //     // var response = await http.get(Uri.parse(
  //     //     '$url?country=in&category=business&apiKey=6e0487582b604f03811e07a40dbc59bc'));
  //     var jsonData = jsonDecode(response.body);
  //     if (jsonData['status'] == "ok") {
  //       jsonData["articles"].forEach((json) {
  //         if (json["urlToImage"] != null &&
  //             json["description"] != null &&
  //             json["author"] != null &&
  //             json["title"] != null &&
  //             json["content"] != null &&
  //             json["url"] != null &&
  //             json["publishedAt"] != null) {
  //           ArticleModel articleModel = ArticleModel(
  //               author: json["author"],
  //               title: json["title"],
  //               description: json["description"],
  //               url: json["url"],
  //               urlToImage: json["urlToImage"],
  //               content: json["content"],
  //               publishedAt: json["publishedAt"]);
  //           news.add(articleModel);
  //         }
  //       });
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print('Something went wrong');
  //     }
  //   }
  //   setState(() {
  //     isFirstLoadRunning = false;
  //   });
  // }

  // late ScrollController controller;
  // @override
  // void initState() {
  //   super.initState();

  //   firstLoad();
  //   controller = ScrollController()..addListener(loadMore);
  // }

  // Future getData() async {
  //   setState(() {
  //     page = 0; //numbers of pages

  //     news.clear();
  //     isFirstLoadRunning = false;
  //     hasNextPage = true;
  //     isLoadRunning = false;
  //     print(
  //         '------------------------------------------------------------------------');
  //     print(news);
  //     firstLoad();
  //     controller = ScrollController()..addListener(loadMore);
  //   });

  //   print(news);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //   RefreshIndicator(
          // onRefresh: getData,
          // child:
          Obx(
        () => controller.isFirstLoadRunning.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    controller: controller.controller,
                    itemCount: controller.news.length,
                    itemBuilder: (context, index) {
                      // print(news.length);
                      return Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFEC5E5),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text('fgg ${controller.news[index].title}'),
                          subtitle: Text(
                              'User Id is ${controller.news[index].description}'),
                        ),
                      );
                    },
                  )),
                  if (controller.isLoadRunning.value == true)
                    const Center(child: CircularProgressIndicator()),
                  // if (controller.hasNextPage.value == false)
                  //   const Center(
                  //     child: Text('No Contents to Load.'),
                  //   )
                ],
              ),
      ),
    );
    // );
  }
}
