import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

import '../fragment/chat_fragment.dart';
import '../fragment/coins_fragment.dart';
import '../fragment/explore_fragment.dart';
import '../fragment/following_fragment.dart';
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
      backgroundColor: UIColors.scaffold,
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
            child: FollowingFragment(),
          ),
          Center(
            child: ExploreFragment(),
          ),
          Center(
            child: CoinsFragment(),
          ),
          Center(
            child: ChatFragment(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
        ),
        selectedItemColor: UIColors.highText,
        unselectedItemColor: UIColors.highText,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? SvgPicture.asset('assets/icons/thumb_fill.svg')
                : SvgPicture.asset('assets/icons/thumb.svg'),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? SvgPicture.asset('assets/icons/users_fill.svg')
                : SvgPicture.asset('assets/icons/users.svg'),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? SvgPicture.asset('assets/icons/search_fill.svg')
                : SvgPicture.asset('assets/icons/search.svg'),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? SvgPicture.asset('assets/icons/star_fill.svg')
                : SvgPicture.asset('assets/icons/star.svg'),
            label: 'Coins',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? SvgPicture.asset('assets/icons/chat_fill.svg')
                : SvgPicture.asset('assets/icons/chat.svg'),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
