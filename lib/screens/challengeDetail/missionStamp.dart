import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeDetail/calendar.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';
import '../certifyPage/doCertify.dart';


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
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.", style: textTheme().headline1),),
            decoration: BoxDecoration(
              color: Color(0xFFE6EFE4),
              border: Border.all(
                width: 1.5,
                color: Color(0xffffffff),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.35),
                  spreadRadius: 1.7,
                  blurRadius: 1.2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          UserInfoWidget(),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Calendar(),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("인증하기 페이지로 이동`");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoCertify()),
              );
            },
            child: Container(
              decoration:BoxDecoration(
                color: Color(0xFFE6EFE4),
                border: Border.all(
                  width: 1.5,
                  color: Color(0xffffffff),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.35),
                    spreadRadius: 1.7,
                    blurRadius: 1.2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("인증하기", style: textTheme().headline1,),
                  Icon(Icons.add),
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
