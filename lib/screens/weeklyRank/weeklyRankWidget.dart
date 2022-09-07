import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/weeklyRank.dart';

import '../challengeList/components/rankDetail.dart';

class WeeklyRankWidget extends StatefulWidget {
  const WeeklyRankWidget({Key? key}) : super(key: key);

  @override
  State<WeeklyRankWidget> createState() => _WeeklyRankWidgetState();
}

class _WeeklyRankWidgetState extends State<WeeklyRankWidget> {
  late Future<List<WeeklyRank>> futureWeeklyRankList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeeklyRankList=receiveWeeklyRankList();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeeklyRank>>(
      future:futureWeeklyRankList,
      builder: (context,snapshot){
        var data=snapshot.data;
        print("weekly Rank Printing");
        print(data);
        if(data==null){
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          return Column(
            children: List.generate(
              data.length,
                  (index) => RankDetail(weeklyRankList: data[index]),
            ),
          );
        }
      }
    );
  }
}
