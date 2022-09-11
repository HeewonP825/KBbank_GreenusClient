import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionFeed.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionRank.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionStamp.dart';

class MissionDetailPageView extends StatelessWidget {
  MissionDetailPageView({Key? key}) : super(key: key);


  final PageController missionDetailPageViewController =
  PageController(initialPage: 1); //TODO 나중에 1로 변경해줄것.

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as IngMissionData;
    print("args가 되어야한다!@@@@");
    print(args);
    return PageView(
      controller: missionDetailPageViewController,
      children: [
        MissionStampWidget(args),
        MissionRank(args),
        MissionFeed(args),
      ],
    );
  }
}

