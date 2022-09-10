import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/theme.dart';
import '../../constants.dart';
import '../mainScreens.dart';
import '../components/ImageContainer.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/GreenusSplash.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {
                    _completeSplash(context, MainScreens());
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}