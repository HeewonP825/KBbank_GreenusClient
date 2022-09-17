import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/FriendProfile.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import '../../../../models/finishMissionData.dart';
import '../../../../theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EachFinishMission extends StatelessWidget {
  final FinishMissionData? finishMissionData;

  EachFinishMission({this.finishMissionData});

  @override
  Widget build(BuildContext context) {
    print("FinishMissionData!!!:");
    print(finishMissionData);
    List<FriendProfile>? friendProfileList =
        finishMissionData?.friendProfileList;
    late int list_length = 0;
    if (friendProfileList != null) {
      list_length = friendProfileList.length;
    }

    List<Widget> profileContainerList = [];
    for (int i = 0; i < list_length; i++) {
      profileContainerList.add(
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new Image.network(friendProfileList![i].profileUrl).image,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("눌림`");
              Navigator.pushNamed(
                context,
                '/challengeDetailHome',
                arguments: IngMissionData(
                  groupId: finishMissionData?.groupId ?? 0,
                  missionName: finishMissionData?.missionName ?? "미션 이름 x",
                  friendProfileList: friendProfileList ?? [],
                  backgroundImage: finishMissionData?.backgroundImage ?? '',
                  startDate: finishMissionData?.startDate ?? "지구가 태어날대부터 시작함",
                  isGoing: false,
                ),
              );
            },
            child: Container(
              // width: 400,
              // height: 230,
              margin: EdgeInsets.fromLTRB(6, 6, 6, 0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: new DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image:
                      new AssetImage(finishMissionData?.backgroundImage ?? ''),
                ),
              ),
            ),
          ),
          // Card(
          //   clipBehavior: Clip.antiAlias,
          //   color: Color(0xffffff),

          Column(
            children: <Widget>[
              Container(
                width: 5,
                height: 5,
                //margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //padding: const EdgeInsets.all(15.0),
              ),
              ListTile(
                //leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(
                  finishMissionData?.missionName ?? '',
                  style: textTheme().headline1,
                ),
                subtitle: Text(
                  '${finishMissionData?.startDate ?? ''} ~ ${finishMissionData?.finishDate ?? ''}',
                  style: textTheme().subtitle1,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: profileContainerList
                ),
            ],
          ),
        ],
      ),
    );
  }
}
