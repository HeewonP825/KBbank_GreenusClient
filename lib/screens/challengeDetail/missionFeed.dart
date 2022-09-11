import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import 'package:kbbank_practice/screens/missionPage/components/missionWithFriends.dart';
import 'package:kbbank_practice/screens/missionPage/newMissionList.dart';
import 'package:like_button/like_button.dart';
import 'package:kbbank_practice/screens/challengeList/components/numberIndicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../theme.dart';

class MissionFeed extends StatefulWidget {
  @override
  MissionFeedState createState() => MissionFeedState();
}

class MissionFeedState extends State<MissionFeed> {

  @override
  Widget build(BuildContext context) {

    // LikeButton(
    //   size: 15,
    //   circleColor:
    //   CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
    //   bubblesColor: BubblesColor(
    //     dotPrimaryColor: Color(0xff33b5e5),
    //     dotSecondaryColor: Color(0xff0099cc),
    //   ),
    // );

    // countBuilder: (int count, bool isLiked, String text) {
    //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
    //   Widget result;
    //   if (count == 0) {
    //     result = Text(
    //       "love",
    //       style: TextStyle(color: color),
    //     );
    //   } else
    //     result = Text(
    //       text,
    //       style: TextStyle(color: color),
    //     );
    //   return result;
    // };

    Future<bool> onLikeButtonTapped(bool isLiked) async{
    // // send your request here
    // final bool success= (await LikeButton()) as bool;
    //
    // // if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "GREENUS",
          style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (Icon(Icons.keyboard_return)),
        backgroundColor: Color(0xff111421), //Widget 추가
        onPressed: () {
          // 이벤트 콜백 함수
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => NewMissionList()),
          );
        },
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.", style: textTheme().headline1),),
            decoration: BoxDecoration(
              color: const Color(0xFFC3D9F1),
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
          Container(
            child:Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 20),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      //profileImage
                      height: 37,
                      width: 37,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 5, 4, 5),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    title: const Text("이름", style: TextStyle(fontFamily: 'ELAND', fontSize: 18,),),
                    subtitle: Text(
                      'Lv1',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                  Image.asset('assets/images/banner.jpg'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '~사진 내용 설명 텍스트 들어갈 부분~',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  // Container(
                  //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  //     width: 400,
                  //     child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
                  Container(
                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(12, 0, 20, 10),
                    child: LikeButton(
                      mainAxisAlignment: MainAxisAlignment.start,
                      likeCount: 0,
                      onTap: onLikeButtonTapped,
                    ),
                  ),
                  // ButtonBar(
                  //   alignment: MainAxisAlignment.start,
                  //   children: [
                  //     FlatButton(
                  //       textColor: const Color(0xFF6200EE),
                  //       onPressed: () {
                  //         // Perform some action
                  //       },
                  //       child: const Text('ACTION 1'),
                  //     ),
                  //     FlatButton(
                  //       textColor: const Color(0xFF6200EE),
                  //       onPressed: () {
                  //         // Perform some action
                  //       },
                  //       child: const Text('ACTION 2'),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}