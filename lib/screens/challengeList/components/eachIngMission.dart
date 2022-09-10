import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kbbank_practice/models/FriendProfile.dart';
import 'package:kbbank_practice/screens/challengeDetail/challengeDetalHome.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionRank.dart';
import '../../../../models/ingMissionData.dart';
import '../../../../theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EachIngMission extends StatelessWidget {
  final IngMissionData? ingMissionData;

  EachIngMission({this.ingMissionData});


  @override
  Widget build(BuildContext context) {
    print("ingMissionData!!!:");
    print(ingMissionData);
    List<FriendProfile>? friendProfileList = ingMissionData?.friendProfileList;
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
                  groupId: ingMissionData?.groupId?? 0,
                  missionName: ingMissionData?.missionName ?? "미션 이름 x",
                  friendProfileList: friendProfileList ?? [],
                  backgroundImage: ingMissionData?.backgroundImage ?? '',
                  startDate: ingMissionData?.startDate ?? "지구가 태어날대부터 시작함",
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
                      Colors.white.withOpacity(0.7), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image: new AssetImage(ingMissionData?.backgroundImage ?? ''),
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
              // ButtonBar(
              //   alignment: MainAxisAlignment.start,
              //   children: [
              //     FlatButton(
              //       onPressed: () {
              //         // Perform some action
              //       },
              //       child: const Text('ACTION 1'),
              //     ),
              //   ],
              // ),
              // Container(
              //   decoration: new BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: new DecorationImage(
              //       fit: BoxFit.fill,
              //       image: new AssetImage(
              //           ingMissionData?.image ?? ''
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          // ),
        ],
        //physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
