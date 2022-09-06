import 'dart:core';

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
            FutureBuilder<MyPageData>(
              future: receiveMyPageData(),
              builder: (context, snapshot) {
                var data=snapshot.data;
                if(data==null){
                    return CircularProgressIndicator();
                }else{
                print("여기가 들어오긴 하니?");
                  return SizedBox(
                      height: 290,
                      child: MyPageHeader(myPageData : data),
                  );
                }
              }
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

            FutureBuilder<List<IngMissionData>>(
                future: receiveIngMissionData(),
                builder:(context,snapshot){
                  if(snapshot.data==null){
                    return CircularProgressIndicator();
                  }else{
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context,index) => MyPageIngMission(ingMissionData: snapshot.data?[index]),
                    );
                  }
                }
              )
            ]

            ),
        );
    }
}
