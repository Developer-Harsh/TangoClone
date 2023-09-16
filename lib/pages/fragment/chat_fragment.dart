import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/pages/fragment/coins_fragment.dart';

import '../../models/User.dart';
import '../../utils/colors.dart';
import '../../widgets/grad_circle_button.dart';
import '../../widgets/user_list.dart';

class ChatFragment extends StatelessWidget {
  //const FollowingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Stack(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: UIColors.scaffold,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 15,
                      right: 15,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        const ClipOval(
                          child: Image(
                            image:
                                AssetImage('assets/images/profile_picture.png'),
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Image(
                            image: AssetImage('assets/images/coin.png'),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.getFont('Readex Pro').fontFamily,
                              color: UIColors.highText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/search.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/inbox.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/new_message.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // special offer

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoinsFragment(),
                    ),
                  );
                },
                child: Image.network(
                  'https://cget.tango.me/contentserver/download/YupAeQAAyW5VfotOpQBS0w/SRvSZop1&quot',
                ),
              ),

              Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/message_hi.png'),
                    width: 80,
                    height: 60,
                    color: UIColors.highText,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'No messages here yet',
                      style: TextStyle(
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                        color: UIColors.highText,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3,
                    ),
                    child: Text(
                      'write someone first to start a conversation',
                      style: TextStyle(
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                        color: UIColors.mediumText,
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 36,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 18,
                        bottom: 18,
                        left: 40,
                        right: 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: UIColors.box_color,
                        ),
                      ),
                      child: Text(
                        'Start Chat',
                        style: TextStyle(
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                          color: UIColors.highText,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // we need to complete this layout also for chat list
            ],
          ),
        ],
      ),
    );
  }
}

// create