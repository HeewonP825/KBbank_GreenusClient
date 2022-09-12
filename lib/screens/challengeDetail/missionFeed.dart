import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/feed.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import 'package:kbbank_practice/screens/challengeDetail/eachFeed.dart';
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
  final IngMissionData ingMissionData;

  const MissionFeed(this.ingMissionData, {Key? key}) : super(key: key);

  @override
  MissionFeedState createState() => MissionFeedState();
}

class MissionFeedState extends State<MissionFeed> {
  late Future<List<Feed>> futureFeedList;

  void initState() {
    super.initState();
    futureFeedList = receiveFeeds(widget.ingMissionData.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "GREENUS",
            style: TextStyle(
              fontFamily: 'ChangwonDangamAsac',
              fontSize: 30,
            ),
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
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(
              child: Text(widget.ingMissionData.missionName,
                  style: textTheme().headline1),
            ),
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
          FutureBuilder<List<Feed>>(
              future: futureFeedList,
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView(
                      children:
                          List.generate(data.length, (index) => EachFeed(data[index])),
                    ),
                  );
                }
              })
        ]));
  }
}
