import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

import '../../models/LiveUsers.dart';
import '../../widgets/grad_circle_button.dart';
import '../../widgets/user_list.dart';
import 'explore_pages/artist.dart';
import 'explore_pages/nearby.dart';
import 'explore_pages/new_accounts.dart';
import 'explore_pages/popular.dart';
import 'explore_pages/rising_stars.dart';

class ExploreFragment extends StatefulWidget {
  // const ExploreFragment({super.key});

  @override
  State<ExploreFragment> createState() => _ExploreFragmentState();
}

class _ExploreFragmentState extends State<ExploreFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _currentIndex = _tabController.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(
        index,
        duration: Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: "Starline",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: UIColors.scaffold,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: UIColors.scaffold,
          title: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                color: UIColors.scaffold,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22,
                      left: 13,
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/profile_picture.png'),
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  Container(
                    width: 163,
                    decoration: BoxDecoration(
                      color: UIColors.box_color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                        top: 7,
                        bottom: 7,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/search.svg',
                            width: 16,
                            height: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 7,
                            ),
                            child: Text(
                              'Search...',
                              style: TextStyle(
                                fontFamily: GoogleFonts.getFont('Readex Pro')
                                    .fontFamily,
                                fontSize: 14,
                                color: UIColors.lowText,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13,
                      right: 13,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 13,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/leaderboard.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 13,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/feeds.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/notification.svg',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: TabBar(
            onTap: _onItemTapped,
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Artist',
              ),
              Tab(
                text: 'Nearby',
              ),
              Tab(
                text: 'Populars',
              ),
              Tab(
                text: 'New',
              ),
              Tab(
                text: 'Rising Stars',
              ),
            ],
            indicator: BoxDecoration(
              color: Colors.transparent,
            ),
            labelColor: UIColors.pink,
            unselectedLabelColor: UIColors.lowText,
            labelStyle: TextStyle(
                fontSize: 12,
                fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                color: UIColors.pink,
                fontWeight: FontWeight.w200),
            unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                color: UIColors.lowText,
                fontWeight: FontWeight.w100),
            labelPadding: EdgeInsets.all(0),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: ArtistExplorePage(),
            ),
            Center(
              child: NearbyExplorePage(),
            ),
            Center(
              child: PopularsExplorePage(),
            ),
            Center(
              child: NewAccountExplorePage(),
            ),
            Center(
              child: RisingStarsExplorePage(),
            ),
          ],
        ),
      ),
    );
  }
}
