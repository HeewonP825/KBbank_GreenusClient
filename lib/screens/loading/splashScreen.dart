import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/kakao_login.dart';
import 'package:kbbank_practice/models/main_view_model.dart';
import 'package:kbbank_practice/theme.dart';
import '../../constants.dart';
import '../mainScreens.dart';
import '../components/ImageContainer.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  final viewModel=MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    // _login();
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
                  onTap: () async{
                    await viewModel.login();
                    print("model!!!");
                    print(viewModel.user?.id);
                    print(viewModel.user?.properties);
                    _completeSplash(context, MainScreens());
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
  //
  // Future<void> _login() async {
  //   final _storage=const FlutterSecureStorage();
  //   final String key = "userId";
  //   final String value = "1";
  //
  //   await _storage.write(
  //     key: key,
  //     value: value,
  //   );
  // }
  void _completeSplash(BuildContext context, Widget widget){

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}