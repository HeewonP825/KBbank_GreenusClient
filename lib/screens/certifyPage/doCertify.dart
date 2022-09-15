//import 'dart:html';

import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kbbank_practice/screens/certifyPage/getImageWidget.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionFeed.dart';
import 'package:kbbank_practice/screens/challengeDetail/missionStamp.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/ingMissionData.dart';
import '../challengeDetail/missionStamp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme.dart';

class DoCertify extends StatefulWidget {

  final IngMissionData ingMissionData;

  const DoCertify(this.ingMissionData);

  @override
  DoCertifyState createState() => DoCertifyState();
}

class DoCertifyState extends State<DoCertify> {


  final ButtonStyle RoundButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xff111421),
    //primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    elevation: 5,
    // shape
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(27.5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(
            "GREENUS",
            style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: const Color(0xff111421),//Widget 추가
          onPressed: () { // 이벤트 콜백 함수
            Navigator.pop(
              context,
              // MaterialPageRoute(builder: (context) => MissionStampWidget()),
            );
          },
        ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              //padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              height: 30,
              child: Flexible(
                flex: 5,
                child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "인증하기",
                      style: TextStyle(
                        fontFamily: 'ELAND',
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.draw,
                      size: 25,
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(160, 5, 0, 10),
                        alignment: Alignment.topRight,
                        child: Text(
                          "2022-09-12",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Container(
              width: 400,
              child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
              //padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Flexible(
                flex: 5,
                child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getImageWidget(),
                    getImageWidget(),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 3, 15, 15),
              //padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Flexible(
                flex: 5,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getImageWidget(),
                    getImageWidget(),
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: 400,
              child: Divider(color: Color(0xFFE8E8E8), thickness: 1.0)),
          ElevatedButton(
              style: RoundButtonStyle,
              child: Text('인증하기', style: textTheme().headline2),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false, // 바깥 영역 클릭 시 안닫힘
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('팝업 알림창'),
                        content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('인증하시겠습니까?'),
                              ],
                            )
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('네'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (context) => MissionFeed(widget.ingMissionData)),
                              );
                            },
                          ),
                          FlatButton(
                            child: Text('아니오'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigator.pop(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => DoCertify()),
                              // );
                            },
                          ),
                        ],
                      );
                    }
                );
              }
          ),
        ],
      ),
    );
  }
}