import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeDetail/calendar.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:table_calendar/table_calendar.dart';


class MissionStampWidget extends StatelessWidget {
  const MissionStampWidget({Key? key}) : super(key: key);

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
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.")),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          UserInfoWidget(),
          Calendar(),
          GestureDetector(
            onTap: (){
              print("인증하기 페이지로 이동되어야함.");
            },
            child: Container(
              decoration:BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "인증하기",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                  ),
                  Icon(
                    Icons.add_circle_outline_rounded,
                    size: 50,
                  )
                ],
              )
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: Colors.green, //Widget 추가
          onPressed: () {
            // 이벤트 콜백 함수
            Navigator.pop(
              context,
            );
          },
        ));
  }
}
