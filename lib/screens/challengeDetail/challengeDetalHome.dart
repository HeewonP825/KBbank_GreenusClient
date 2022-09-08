import 'package:flutter/material.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionRank.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionStamp.dart';

class MissionDetailPageView extends StatelessWidget {
  MissionDetailPageView({Key? key}) : super(key: key);

  final PageController missionDetailPageViewController =
  PageController(initialPage: 1); //TODO 나중에 1로 변경해줄것.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MissionStampWidget(),
    );
    // return PageView(
    //   controller: missionDetailPageViewController,
    //   children: [
    //     MissionStampWidget(),
    //     MissionRank(),
    //   ],
    // );
  }
}

