import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'routes.dart';
import 'screens/loading/splashScreen.dart';
import 'screens/mainScreens.dart';
import 'theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '8ca73fd19e3d1b2a6c15ede472c95b5a');
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
      initialRoute: '/splash',
      //home: mainScreens(),
      routes: route,
      theme: theme(),
    );
  }
}
