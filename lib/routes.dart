import 'package:flutter/material.dart';
import 'package:kbbank_practice/screens/challengeDetail/challengeDetalHome.dart';
import 'package:kbbank_practice/screens/challengeList/challengeHome.dart';
import 'screens/mainScreens.dart';
import 'screens/loading/splashScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final Map<String, WidgetBuilder> route = {
  //FlutterNativeSplash.routeName: (context) => FlutterNativeSplash(),
  '/splash': (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  '/challengeDetailHome': (context) => MissionDetailPageView(),
  //"/mainScreens": (context) => MainScreens()
};