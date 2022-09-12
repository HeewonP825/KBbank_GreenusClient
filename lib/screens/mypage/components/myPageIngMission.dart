import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/FriendProfile.dart';
import 'package:kbbank_practice/screens/challengeDetail/challengeDetalHome.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionRank.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionStamp.dart';
import '../../../../models/ingMissionData.dart';
import '../../../../theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class MyPageIngMission extends StatelessWidget {

  final IngMissionData? ingMissionData;

  MyPageIngMission({this.ingMissionData});

  @override
  Widget build(BuildContext context) {
    List<FriendProfile>? friendProfileList = ingMissionData?.friendProfileList;
    late int list_length = 0;
    if (friendProfileList != null) {
      list_length = friendProfileList.length;
    }

    List<Widget> profileContainerList = [];
    for (int i = 0; i < list_length; i++) {
      profileContainerList.add(
        Container(
          margin: const EdgeInsets.fromLTRB(15, 65, 6, 10),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new Image.network(
                  friendProfileList![i].profileUrl
              ).image,
            ),
          ),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            print("인증하기 페이지로 이동`");
            Navigator.pushNamed(
              context,
              '/challengeDetailHome',
              arguments: IngMissionData(
                groupId: ingMissionData?.groupId?? 0,
                missionName: ingMissionData?.missionName ?? "미션 이름 x",
                friendProfileList: friendProfileList ?? [],
                backgroundImage: ingMissionData?.backgroundImage ?? '',
                startDate: ingMissionData?.startDate ?? "지구가 태어날대부터 시작함",
              ),
            );
          },
          child: Container(
            //width: 400,
            height: 110,
            margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 1.5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.  white,
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.arrow_drop_down_circle),
          title: Text(
            ingMissionData?.missionName ?? '',
            style: textTheme().headline1,
          ),
          subtitle: Text(
            '${ingMissionData?.startDate ?? ''} ~',
            style: textTheme().subtitle1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: profileContainerList,
        ),
      ],
    );
  }
}