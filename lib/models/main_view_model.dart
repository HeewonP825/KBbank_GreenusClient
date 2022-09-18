import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kbbank_practice/social_login.dart';

class MainViewModel{
  final SocialLogin _socialLogin;
  bool isLogined=false;
  User? user;



  MainViewModel(this._socialLogin);


  Future login() async{
    isLogined=await _socialLogin.login();
    print("isLogined?");
    print(isLogined);
    if(isLogined){
      user=await UserApi.instance.me();
      print("user!!!!");
      print(user?.id);
      print(user?.properties?['nickname']);
      print(user?.properties?['profile_image']);

      var dio=Dio(BaseOptions(
          baseUrl: "https://dev.uksfirstdomain.shop" // Todo : local에서 실험용 url
      ));



      var response = await dio.get('/app/users/${user?.id}');


      print("response!!!!@#!@#!@!@@!");
      print(response.data['code']);
      print(response.data);
      if(response.data['code']==2001){
        print("아직 회원이 아닙니다.");
        response=
        await dio.post('/app/users'
            , data: {
              'userId':user?.id,
              'userName':user?.properties?['nickname'],
              'profileImgUrl':user?.properties?['profile_image']
            });
        print("node서버에 user정보 삽입 요청후 반환값");
      }else if(response.data['code']==2002){
        print("이미 회원입니다.");
      }

    }
  }

  Future logout() async{
    await _socialLogin.logout();
    isLogined=false;
    user=null;
  }
}