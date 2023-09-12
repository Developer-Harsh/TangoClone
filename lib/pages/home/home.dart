import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../fragment/home_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Center(
            child: HomeFragment(),
          ),
          Center(
            child: Text('Search Page'),
          ),
          Center(
            child: Text('Profile Page'),
          ),
          Center(
            child: Text('Profile Page'),
          ),
          Center(
            child: Text('Profile Page'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Icon(Icons.thumb_up_alt)
                : Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Icon(Icons.thumb_up_alt)
                : Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
            label: 'Following',
          ),
          BottomNavigationBarItem(
          icon: _currentIndex == 0
                ? Icon(Icons.thumb_up_alt)
                : Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
           icon: _currentIndex == 0
                ? Icon(Icons.thumb_up_alt)
                : Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
            label: 'Coins',
          ),
          BottomNavigationBarItem(
           icon: _currentIndex == 0
                ? Icon(Icons.thumb_up_alt)
                : Icon(
                    Icons.thumb_up_alt_outlined,
                  ),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
