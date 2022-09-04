import 'package:flutter/material.dart';
import 'routes.dart';
import 'screens/loading/splashScreen.dart';
import 'screens/mainScreens.dart';
import 'theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(Greenus());
}

/*Map<String, WidgetBuilder> routes = {
  "/": (context) => mainScreens(),
  "/mainScreens": (context) => mainScreens()
};*/

class Greenus extends StatelessWidget {
  //static String routeName = "/mainScreens";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Greenus",
      initialRoute: SplashScreen.routeName,
      //home: mainScreens(),
      routes: route,
      theme: theme(),
    );
  }
}
