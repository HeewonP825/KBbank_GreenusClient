import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "GREENUS",
              style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
            ),
          ),
        ),
      ),
    );

    return Container(child: Text("IngMission Screen"),
    );
  }
}