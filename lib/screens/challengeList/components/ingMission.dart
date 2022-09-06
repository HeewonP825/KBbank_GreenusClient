import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/ingMissionData.dart';
import 'eachIngMission.dart';
import '../../../../theme.dart';

class IngMission extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: (Icon(Icons.add)),
        backgroundColor: Colors.green,//Widget 추가
        onPressed: () { // 이벤트 콜백 함수
          //print('Hi there!');
        },
      ),

      body: ListView(
          prototypeItem: SizedBox(height: 132),
          children: List.generate(
            ingMissionData.length,
              (index) {
                print(ingMissionData[index]);
                return EachIngMission(ingMissionData: ingMissionData[index]);
              },
          ),
        ),
    );
  }
}
