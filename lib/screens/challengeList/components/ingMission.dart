import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/ingMissionData.dart';
import 'eachIngMission.dart';
import '../../../../theme.dart';

class IngMission extends StatelessWidget {

  // final IngMissionData? ingMissionData;
  //
  // const IngMission({Key? key, this.ingMissionData}) : super(key: key);

  // EachIngMission({this.ingMissionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          prototypeItem: SizedBox(height: 250),
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
