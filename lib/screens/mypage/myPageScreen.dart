import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/myPageHeader.dart';
import '../../../theme.dart';

class MyPageScreen extends StatelessWidget {
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
          MyPageHeader(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text("진행 중인 미션", style: textTheme().headline1,),
            ),
          ],
        ),
    );
  }
}
