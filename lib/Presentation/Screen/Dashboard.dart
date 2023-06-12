import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/DashboardController.dart';
import 'package:lask/Package/Constants.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:lask/Presentation/Screen/ExploreScreen.dart';
import 'package:lask/Presentation/Screen/HomeScreen.dart';
import 'package:lask/Presentation/Screen/ProfileScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

import 'BookmarkedScreen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  DashboardController controller = DashboardController();
  List pages = [
    HomeScreen(),
    ExploreScreen(),
    BookmarkedScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Obx(
          () => Container(
            decoration: BoxDecoration(color: navBG, borderRadius: radius(10)),
            child: SalomonBottomBar(
              currentIndex: controller.currentIndex.value,
              onTap: (i) => controller.changeIndex(i),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  title: Text("Explore"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.bookmark_outline),
                  title: Text("Bookmark"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  // activeIcon:
                  icon: Icon(Icons.person_outline_rounded),
                  // Image.asset('assets/icons/navActive4.png', height: 24),
                  // icon: Image.asset('assets/icons/nav4.png', height: 24),
                  title: Text("Profile"),
                  // title: TextFW600(text: 'Profile', fontSize: 12),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => pages[controller.currentIndex.value]),
    );
  }
}
