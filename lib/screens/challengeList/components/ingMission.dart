import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/ingMissionData.dart';
import 'package:kbbank_practice/screens/missionPage/newMissionList.dart';
import 'eachIngMission.dart';
import '../../../../theme.dart';

class IngMissionWidget extends StatefulWidget {
  const IngMissionWidget({Key? key}) : super(key: key);

  @override
  State<IngMissionWidget> createState() => _IngMissionWidgetState();
}

class _IngMissionWidgetState extends State<IngMissionWidget> {
  late Future<List<IngMissionData>> futureIngMissionData;

  void initState(){
    super.initState();
    futureIngMissionData=receiveIngMissionData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IngMissionData>>(
      future: futureIngMissionData,
      builder: (context,snapshot) {
        var data = snapshot.data;
        if (data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: (Icon(Icons.add)),
              backgroundColor:  Color(0xff111421),//Widget 추가
              onPressed: () async{ // 이벤트 콜백 함수
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewMissionList()),
                );
                setState(() {
                  futureIngMissionData=receiveIngMissionData();
                });
              },
            ),
            body: ListView(
              prototypeItem: SizedBox(height: 132),
              children: List.generate(
                data.length,
                    (index) {
                  print(data[index]);
                  return EachIngMission(ingMissionData: data[index]);
                },
              ),
            ),
          );
        }
      });
  }
}
