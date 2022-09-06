import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import 'package:kbbank_practice/screens/missionPage/newMissionList.dart';
import 'missionList.dart';

import '../../../../theme.dart';

class MissionDetail extends StatelessWidget {
  //late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "GREENUS",
          style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: (Icon(Icons.keyboard_return)),
        backgroundColor: Colors.green, //Widget 추가
        onPressed: () { // 이벤트 콜백 함수
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => NewMissionList()),
          );
        },
      ),
    );
  }
}