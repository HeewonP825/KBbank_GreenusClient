import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kbbank_practice/models/FriendProfile.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import 'package:kbbank_practice/models/missionRankUserInfo.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import '../../../constants.dart';
import '../../../theme.dart';

class MissionRank extends StatefulWidget {
  final IngMissionData ingMissionData;

  const MissionRank(this.ingMissionData, {Key? key}) : super(key: key);

  @override
  State<MissionRank> createState() => _MissionRankState();
}

class _MissionRankState extends State<MissionRank> {
  late Future<List<MissionRankUserInfo>> futureRankUserList;

  void initState() {
    super.initState();
    futureRankUserList =
        receiveMissionRankUserInfo(widget.ingMissionData.groupId);
  }

  @override
  Widget build(BuildContext context) {
    print("ingMissionData는 생성자에서 처리됩니다.");
    print(widget.ingMissionData.missionName);
    print(widget.ingMissionData.friendProfileList);

    var friendProfileList = [];
    for (int i = 0; i < widget.ingMissionData.friendProfileList.length; i++) {
      friendProfileList.add(
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 6, 5),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new Image.network(
                      widget.ingMissionData.friendProfileList[i].profileUrl)
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
            style: TextStyle(
              fontFamily: 'ChangwonDangamAsac',
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: friendProfileList.cast()),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 400,
                child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
            FutureBuilder(
                future: futureRankUserList,
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  print("data:");
                  print(data);
                  if (data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 0, 5),
                              width: double.infinity,
                              child: Text(
                                "Me",
                                style: textTheme().headline1,
                              ),
                            ),
                            UserInfoWidget((data as List)[0]),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 0, 5),
                              width: double.infinity,
                              child: Text(
                                "Ranking",
                                style: textTheme().headline1,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: (data as List).length,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return SizedBox(
                                        width: 0,
                                        height: 0,
                                      );
                                    }
                                    ;
                                    return UserInfoWidget(
                                        (data as List)[index]);
                                  }),
                            )
                          ],
                        ));
                  }
                }),
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

Future<List<MissionRankUserInfo>> receiveMissionRankUserInfo(groupId) async {
  //Todo userId수정 필요
  // var userId = 1;
  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio
      .get('/app/MyMissionMainPage/users/${tokenInfo.id}/groupId/${groupId}');

  print("/app/MyMissionMainPage/users/${tokenInfo.id}/groupId/${groupId}");
  print("미션 랭크를 출력합시다!!! ");
  print("여러분~?");
  print("당연히~ 제가~ 1등이겠죠?");
  print(response.data["result"]);
  print(response.data["result"]['rankingLists']);
  final data = response.data["result"]['rankingLists'];

  List<MissionRankUserInfo> rankUserInfoList = [];

  for (int i = 0; i < data.length; i++) {
    var rank = data[i]['ranking'];
    String rankStr="";
    switch(rank){
      case 0:
        rankStr="Me";
        break;
      case 1:
        rankStr="assets/icons/1.png";
        break;
      case 2:
        rankStr="assets/icons/2.png";
        break;
      case 3:
        rankStr="assets/icons/3.png";
        break;
      case 4:
        rankStr="assets/icons/4.png";
        break;
      case 5:
        rankStr="assets/icons/5.png";
        break;
      case 6:
        rankStr="assets/icons/6.png";
        break;
      case 7:
        rankStr="assets/icons/7.png";
        break;
      case 8:
        rankStr="assets/icons/8.png";
        break;
      case 9:
        rankStr="assets/icons/9.png";
        break;
      case 10:
        rankStr="assets/icons/10.png";
        break;
      default:
        rankStr="순위권 밖"; //Todo 10명넘었을때도 에러 발생 안하도록 대처할것.
    }
    rankUserInfoList.add(MissionRankUserInfo(
        ranking: rankStr,
        userName: data[i]['userName'],
        totalStampNum: 1000,
        stampNum: data[i]['stamp'],
        userLevel: data[i]['userLevel'],
        profileImgUrl: data[i]['profileImgUrl']));
  }

  return rankUserInfoList;
}
