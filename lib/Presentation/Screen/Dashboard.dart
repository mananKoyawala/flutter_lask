import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/DashboardController.dart';
import 'package:lask/Presentation/Screen/ExploreScreen.dart';
import 'package:lask/Presentation/Screen/HomeScreen.dart';
import 'package:lask/Presentation/Screen/ProfileScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  DashboardController controller = DashboardController();
  List pages = [
    HomeScreen(),
    ExploreScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
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
              icon: Icon(Icons.favorite_border),
              title: Text("Explore"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Bookmark"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
      body: Obx(() => pages[controller.currentIndex.value]),
    );
  }
}
