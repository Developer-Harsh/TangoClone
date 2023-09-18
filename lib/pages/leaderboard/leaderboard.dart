import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => {},
                    child: SvgPicture.asset(
                      'assets/icons/left.svg',
                      color: UIColors.highText,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: TabBar(
                          controller: _controller,
                          tabs: [
                            Tab(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                ),
                                child: Text('Creators'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                ),
                                child: Text('Family'),
                              ),
                            ),
                          ],
                          isScrollable: true,
                          physics: ScrollPhysics(),
                          indicatorColor: const Color.fromARGB(0, 0, 0, 0),
                          automaticIndicatorColorAdjustment: false,
                          labelColor: UIColors.highText,
                          unselectedLabelColor: UIColors.lowText,
                          labelStyle: TextStyle(
                            fontSize: 24,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                            color: UIColors.highText,
                            fontWeight: FontWeight.w900,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 24,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                            color: UIColors.lowText,
                            fontWeight: FontWeight.w900,
                          ),
                          labelPadding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Center(
                  child: CreatorsFragment(),
                ),
                Center(
                  child: CreatorsFragment(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreatorsFragment extends StatefulWidget {
  // const CreatorsFragment({super.key});

  @override
  State<CreatorsFragment> createState() => _CreatorsFragmentState();
}

class _CreatorsFragmentState extends State<CreatorsFragment>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                  width: 220,
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: UIColors.box_color,
                  ),
                  child: TabBar(
                    controller: _controller,
                    tabs: [
                      Container(
                        height: 20,
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Tab(
                          text: 'Daily',
                        ),
                      ),
                      Container(
                        height: 20,
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Tab(
                          text: 'Weekly',
                        ),
                      ),
                      Container(
                        height: 20,
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Tab(
                          text: 'All Time',
                        ),
                      ),
                    ],
                    isScrollable: true,
                    physics: ScrollPhysics(),
                    indicator: BoxDecoration(
                      color: UIColors.scaffold,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Color.fromARGB(255, 255, 255, 255),
                    automaticIndicatorColorAdjustment: false,
                    labelColor: UIColors.highText,
                    unselectedLabelColor: UIColors.lowText,
                    labelStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                      color: UIColors.highText,
                      fontWeight: FontWeight.w200,
                    ),
                    indicatorPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                      color: UIColors.lowText,
                      fontWeight: FontWeight.w200,
                    ),
                    labelPadding: EdgeInsets.all(0),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: UIColors.box_color,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: UIColors.box_color,
                            width: 1.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile_picture.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: UIColors.box_color,
                              width: 1.5,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile_picture.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: UIColors.box_color,
                              width: 1.5,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile_picture.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyFragment extends StatefulWidget {
  // const FamilyFragment({super.key});

  @override
  State<FamilyFragment> createState() => _FamilyFragmentState();
}

class _FamilyFragmentState extends State<FamilyFragment>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: TabBar(
                controller: _controller,
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Text('Daily'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Text('Weekly'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Text('All Time'),
                    ),
                  ),
                ],
                isScrollable: true,
                physics: ScrollPhysics(),
                indicatorColor: const Color.fromARGB(0, 0, 0, 0),
                automaticIndicatorColorAdjustment: false,
                labelColor: UIColors.highText,
                unselectedLabelColor: UIColors.lowText,
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                  color: UIColors.highText,
                  fontWeight: FontWeight.w200,
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
        ],
      ),
    );
  }
}
