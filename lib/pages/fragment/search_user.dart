import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tango/models/User.dart';
import 'package:tango/utils/colors.dart';
import 'package:tango/utils/config.dart';
import 'package:tango/widgets/list_view_users.dart';

import '../../models/LiveUsers.dart';
import '../../widgets/user_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  List<dynamic> usersData = [];
  List<dynamic> filteredUsersData = [];
  TextEditingController searchController = TextEditingController();

  List<dynamic> liveUsersData = [];

  Future<void> fetchLives() async {
    final response =
        await http.get(Uri.parse(Config.base_url + Config.live_users));

    if (response.statusCode == 200) {
      setState(() {
        liveUsersData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(Config.base_url + Config.live_users));

    if (response.statusCode == 200) {
      setState(() {
        usersData = json.decode(response.body);
        filteredUsersData = List.from(usersData);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  late TabController _tabController;
  int _currentIndex = 0;

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
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _currentIndex = _tabController.index;
      }
    });
    fetchLives();
    fetchData();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredUsersData = List.from(usersData);
      });
    } else {
      setState(() {
        filteredUsersData = usersData.where((user) {
          final username = user['USERNAME'].toString().toLowerCase();
          final name = user['NAME'].toString().toLowerCase();
          return username.contains(query.toLowerCase()) ||
              name.contains(query.toLowerCase());
        }).toList();
      });
    }
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
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 13,
                  left: 13,
                ),
                child: SvgPicture.asset(
                  'assets/icons/left.svg',
                  width: 26,
                  height: 26,
                  color: UIColors.highText,
                ),
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 13),
                  padding: const EdgeInsets.only(
                    left: 13,
                  ),
                  decoration: BoxDecoration(
                    color: UIColors.box_color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        width: 20,
                        height: 20,
                      ),
                      Flexible(
                        child: TextField(
                          controller: searchController,
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: UIColors.highText,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            filled: true,
                            isDense: true,
                            border: InputBorder.none,
                            fillColor: Colors.transparent,
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 13,
                              top: 9,
                              bottom: 9,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                searchController.clear();
                                filterUsers('');
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/close.svg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                          onChanged: (query) {
                            filterUsers(query);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 13),
                child: TabBar(
                  onTap: _onItemTapped,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Text('All'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Text('Live'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Text('People'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Text('Hashtags'),
                      ),
                    ),
                  ],
                  isScrollable: true,
                  physics: ScrollPhysics(),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: UIColors.highText,
                  automaticIndicatorColorAdjustment: false,
                  labelColor: UIColors.highText,
                  unselectedLabelColor: UIColors.lowText,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    color: UIColors.highText,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    color: UIColors.lowText,
                    fontWeight: FontWeight.w200,
                  ),
                  labelPadding: EdgeInsets.all(0),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: filteredUsersData.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = filteredUsersData[index];
                          return ListUserWidget(data: User.fromJson(item));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: liveUsersData.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = liveUsersData[index];
                          return UserWidget(data: LiveUsers.fromJson(item));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: filteredUsersData.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = filteredUsersData[index];
                          return ListUserWidget(data: User.fromJson(item));
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Suggestions',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.getFont('Readex Pro').fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: UIColors.highText,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: filteredUsersData.length,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = filteredUsersData[index];
                              return ListUserWidget(data: User.fromJson(item));
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //   return Scaffold(
  //     body: Padding(
  //       padding: const EdgeInsets.only(
  //         top: 40,
  //         left: 15,
  //         right: 15,
  //       ),
  //       child: Column(
  //         children: [

  //         ],
  //       ),
  //     ),
  //   );
  // }
}
