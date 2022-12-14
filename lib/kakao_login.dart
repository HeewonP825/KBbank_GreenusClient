import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kbbank_practice/social_login.dart';

class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async{
    try{
      bool isInstalled=await isKakaoTalkInstalled();
      if(isInstalled){
        try{
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        }catch(err){
          try{
            await UserApi.instance.loginWithKakaoAccount();
            print("login 성공");
            return true;
          }catch(err){
            print("login 실패");
            return false;
          }
        }
      }else{
        try{
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        }catch(err){
          return false;
        }
      }
      return true;
    }catch(err){
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try{
      await UserApi.instance.unlink();
      return true;
    }catch(error){
      return false;
    }
  }

}