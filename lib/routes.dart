import 'package:flutter/material.dart';
import 'screens/mainScreens.dart';
import 'screens/loading/splashScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final Map<String, WidgetBuilder> route = {
  //FlutterNativeSplash.routeName: (context) => FlutterNativeSplash(),
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens()
  //"/mainScreens": (context) => MainScreens()
};