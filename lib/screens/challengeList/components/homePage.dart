import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        Column(
          children: List.generate(
            weeklyRankList.length,
                (index) => RankDetail(weeklyRankList: weeklyRankList[index]),
          ),
        ),
      ],

    );
    // return Scaffold(
    //   body: ListView(
    //     children: List.generate(
    //       weeklyRankList.length,
    //           (index) => RankDetail(weeklyRank: weeklyRankList[index]),
    //     ),
    //   ),
    // );
    //   /*body: ListView.separated(
    //     separatorBuilder: (context, index) => Divider(
    //       height: 0,
    //       indent: 16,
    //       endIndent: 16,
    //       color: Colors.grey,
    //     ),
    //     itemBuilder: (context, index) {
    //       return RankDetail(
    //         weeklyRank: WRList[index],
    //       );
    //     },
    //     itemCount: WRList.length,
    //   ),*/
    //   /*child: ListView(
    //             padding: const EdgeInsets.all(8),
    //             children: [
    //                itemBuilder: (context, index) {
    //                  return RankDetail(
    //                     weeklyRank: WeeklyRank[index],
    //                   );
    //                 },
    //                 itemCount: productList.length,
    //             ]*/
    //  //);

   }
}