import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eachFinishMission.dart';
import '../../../../models/finishMissionData.dart';
import '../../../../theme.dart';

class FinishMission extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        prototypeItem: SizedBox(height: 145),
        children: List.generate(
          finishMissionData.length,
              (index) {
            print(finishMissionData[index]);
            return EachFinishMission(finishMissionData: finishMissionData[index]);
          },
        ),
      ),
    );
  }
}