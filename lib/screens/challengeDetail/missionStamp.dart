import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kbbank_practice/models/ingMissionData.dart';
import 'package:kbbank_practice/models/missionRankUserInfo.dart';
import 'package:kbbank_practice/screens/challengeDetail/calendar.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionRank.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfoWithoutRank.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';
import '../certifyPage/doCertify.dart';

class MissionStampWidget extends StatefulWidget {
  final IngMissionData ingMissionData;

  const MissionStampWidget(this.ingMissionData, {Key? key}) : super(key: key);

  @override
  State<MissionStampWidget> createState() => _MissionStampWidgetState();
}

class _MissionStampWidgetState extends State<MissionStampWidget> {
  late Future<List<MissionRankUserInfo>> futureRankUserList;

  void initState() {
    super.initState();
    futureRankUserList =
        receiveMissionRankUserInfo(widget.ingMissionData.groupId);
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(mainAxisSize: MainAxisSize.min, children: [
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
          FutureBuilder(
              future: futureRankUserList,
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return UserInfoWithoutRankWidget((data as List)[0]);
                }
              }),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Calendar(widget.ingMissionData.groupId),
            ),
          ),
          widget.ingMissionData.isGoing? GestureDetector(
            onTap: () async{
              print("???????????? ???????????? ??????`");
              int confirmationId=await postFeed(1, widget.ingMissionData.groupId); //todo ????????????.
              print(confirmationId);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoCertify(widget.ingMissionData,confirmationId)),
              );
            },
            child: Container(
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
                  borderRadius: BorderRadius.circular(25.0),
                ),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "????????????",
                      style: TextStyle(
                        fontFamily: 'ELAND',
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ],
                )),
          ): SizedBox()
        ]),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: const Color(0xff111421), //Widget ??????
          onPressed: () {
            // ????????? ?????? ??????
            Navigator.pop(
              context,
            );
          },
        ));
  }
}

Future<int> postFeed(int userId,int groupId) async {
  // var userId = 1; //TODO ????????????.
  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response =
  await dio.post('/app/group/missionConfirmation', data: {
    "userId":tokenInfo.id,
    "groupId": groupId,
  });

  print(response);
  return response.data['result']['confirmationId'];
}