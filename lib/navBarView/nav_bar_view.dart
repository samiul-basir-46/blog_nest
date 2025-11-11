import 'package:blog_app/screen/navBarScreen/blogScreen/blog_screen.dart';
import 'package:blog_app/screen/navBarScreen/bookmarkScreen/bookmark_screen.dart';
import 'package:blog_app/screen/navBarScreen/profileScreen/profile_screen.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

var currentIndex = 0;

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      BlogScreen(),
      BookmarkScreen(
        onBackHome: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
      ProfileScreen(),
    ];

    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.textFieldColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_outlined, color: Colors.grey),
            label: 'Blog',
            activeIcon: Icon(Icons.note, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined, color: Colors.grey),
            label: 'Bookmarks',
            activeIcon: Icon(Icons.bookmark, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
            label: 'Profile',
            activeIcon: Icon(Icons.account_circle, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
