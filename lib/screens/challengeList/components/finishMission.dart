import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eachFinishMission.dart';
import '../../../../models/finishMissionData.dart';
import '../../../../theme.dart';

class FinishMission extends StatefulWidget {
  const FinishMission({Key? key}) : super(key: key);

  @override
  State<FinishMission> createState() => _FinishMissionState();
}

class _FinishMissionState extends State<FinishMission> {
  late Future<List<FinishMissionData>> futureIngMissionData;

  void initState() {
    super.initState();
    futureIngMissionData = receiveFinishMissionData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FinishMissionData>>(
        future: futureIngMissionData,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              body: ListView(
                prototypeItem: SizedBox(height: 132),
                children: List.generate(
                  data.length,
                  (index) {
                    print(data[index]);
                    return EachFinishMission(finishMissionData: data[index]);
                  },
                ),
              ),
            );
          }
        });
  }
}
