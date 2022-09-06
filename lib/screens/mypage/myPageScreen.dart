import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/myPageData.dart';
import 'components/myPageHeader.dart';
import '../../../theme.dart';
import '../../../../models/myPageData.dart';
import '../../../../models/ingMissionData.dart';
import 'components/myPageIngMission.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<MyPageData> receiveMyPageData() async {
  var userId = 12;

  var jsonString = await http.get(
      Uri.parse('https://dev.uksfirstdomain.shop/app/users/${userId}'));
  var resp = jsonDecode(jsonString.body);
  print("receive MyPageData 실행");
  print(resp);
  print(resp['result']);
  print(resp['result']['userName']);


  print("실행전");
  MyPageData myPageData=MyPageData(
        name: resp['result']['userName'],
        profileImage:resp['result']['profileImgUrl'],
        level: 'Lv',
        levelNum: resp['result']['userLevel'],
        badge1: '1',
        badge2: '2',
        badge3: '3',
      );
  print("실행 후");
  print(myPageData);

  return myPageData;
}
class MyPageScreen extends StatefulWidget{
  const MyPageScreen({Key?key}):super(key:key);

  @override
  State<StatefulWidget> createState() => _MyPageScreen();
}

class _MyPageScreen extends State<MyPageScreen> {
  late Future<MyPageData> futureMyPage;

  @override
  void initState() {
    futureMyPage=receiveMyPageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyPageData>(
        future: receiveMyPageData(),
        builder: (context, snapshot) {
          var data=snapshot.data;
          if(data==null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }else{
            print("여기가 들어오긴 하니?");
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "GREENUS",
                  style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
                ),
              ),
              body: ListView(
                children: [
                  SizedBox(
                    height: 290,
                    child: MyPageHeader(myPageData : data),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16),
                    child: Text("진행중인 미션", style: textTheme().headline1,),
                  ),
                  Container(
                      width: 400,
                      child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
                  // 2
                  //SizedBox(height: 550),
                  Column(
                    children: List.generate(
                      ingMissionData.length,
                          (index) {
                              print(ingMissionData[index]);
                              return MyPageIngMission(ingMissionData: ingMissionData[index]);
                          },
                    ),
                  ),
                ],
              ),
            );
          }
    });
  }
}
