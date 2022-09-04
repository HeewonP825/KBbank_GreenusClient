import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/myPageHeader.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "GREENUS",
                style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
    );

    return Scaffold(
      body: ListView(
        children: [
          MyPageHeader(),
          const SizedBox(height: 8.0),
          //CardIconMenu(iconMenuList: iconMenu1),
          //const SizedBox(height: 8.0),
          //CardIconMenu(iconMenuList: iconMenu2),
          //const SizedBox(height: 8.0),
          //CardIconMenu(iconMenuList: iconMenu3),
        ],
      ),
    );
  }
}
