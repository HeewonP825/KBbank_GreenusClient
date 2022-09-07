import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/screens/weeklyRank/weeklyRankWidget.dart';
import '../components/homeRecommendMission.dart';
import '../components/eachWeeklyRank.dart';
//import '../components/rankDetail.dart';
import '../components/numberIndicator.dart';
import '../../../../models/homeBanner.dart';
import '../../../../models/weeklyRank.dart';
import '../../../../theme.dart';
import 'rankDetail.dart';

class HomePage extends StatelessWidget {
  //final List<WeeklyRank> WRList = weeklyRankList;
  @override
  Widget build(BuildContext context) {
    //print("뭐지?????");
    //print(WRList);
     return ListView(
      children: [
        // 위젯 크기 지정
        SizedBox(
          height: 250,
          child: HomeRecommendMission(),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text("주간 등수", style: textTheme().headline1,),
        ),
        // 2
        WeeklyRankWidget(),
      ],

    );
   }
}