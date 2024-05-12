import 'package:flutter/material.dart';
import 'package:instaclone/pages/AddPost.dart';
import 'package:instaclone/pages/HomePage.dart';
import 'package:instaclone/pages/ProfilePage.dart';
import 'package:instaclone/pages/SearchPage.dart';
import 'package:instaclone/pages/reelsPage.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value){
          setState(() {
            currentPage = value;
          });
        }),
        children: [
          HomePage(),
          SearchPage(),
          AddPost(),
          ReelsPage(),
          // ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.blue,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.animateToPage(
                page,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut
            );
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home
              ),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.search
              ),
              label: 'search'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.add
              ),
              label: 'add'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.video_file
              ),
              label: 'reel'
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //         Icons.person_off
          //     ),
          //     label: 'profile'
          // ),
        ],
      ),
    );
  }
}
