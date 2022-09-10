import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/FriendProfile.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import 'package:kbbank_practice/models/missionRankUserInfo.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import '../../../constants.dart';
import '../../../theme.dart';

class MissionRank extends StatelessWidget {
  final IngMissionData ingMissionData;
  const MissionRank(
      this.ingMissionData,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ingMissionData는 생성자에서 처리됩니다.");
    print(ingMissionData.missionName);
    print(ingMissionData.friendProfileList);

    var friendProfileList=[];
    for(int i=0; i<ingMissionData.friendProfileList.length;i++){
      friendProfileList.add(
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 6, 10),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new Image.network(
                  ingMissionData.friendProfileList[i].profileUrl)
                  .image,
            ),
          ),
        ),
      );
    }



    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "GREENUS",
            style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 50,
              alignment: Alignment.topCenter,
              child: Center(child: Text(ingMissionData.missionName, style: textTheme().headline1),),
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: friendProfileList.cast()
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                    UserInfoWidget(),
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: const Color(0xff111421), //Widget 추가
          onPressed: () {
            // 이벤트 콜백 함수
            Navigator.pop(
              context,
            );
          },
        ));
  }
}

// Future<List<MissionRankUserInfo>> receiveMissionRankUserInfo() async {
//   //Todo userId수정 필요
//   var userId = 1;
//
//   var options = BaseOptions(
//     baseUrl: 'https://dev.uksfirstdomain.shop',
//     connectTimeout: 5000,
//     receiveTimeout: 3000,
//   );
//   Dio dio = Dio(options);
//   Response response= await dio.get('/app/MyMissionMainPage');
//
//   print(response.data["result"]);
//   final data=response.data["result"];
//
//   List<MissionRankUserInfo> ingMissionLists=[];
//   List<FriendProfile> friendProfileList=[];
//
//   print("friends");
//   print(data[0]['friends'].runtimeType);
//   print(data[0]['friends'][0]['profileImgUrl']);
//
//   for(int i=0; i<data.length; i++){
//     for(int j=0; j<data[i]['friends'].length; j++){
//       friendProfileList.add(
//           FriendProfile(profileUrl: data[i]['friends'][j]['profileImgUrl'])
//       );
//     }
//     ingMissionLists.add(MissionRankUserInfo(
//       groupId: data[i]['groupId'],
//       missionName: data[i]['missionName'],
//       backgroundImage: "assets/images/banner1.jpg",
//       startDate: data[i]['startDate'],
//       friendProfileList: friendProfileList,
//     ));
//   }
//
//   return ingMissionLists;
// }