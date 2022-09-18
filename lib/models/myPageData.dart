import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MyPageData {
  final String name;
  final int secondId;
  final String profileImage;
  final String level;
  final int levelNum;
  final String badge1;
  final String badge2;
  final String badge3;


  MyPageData({
    required this.name,
    required this.secondId,
    required this.profileImage,
    required this.level,
    required this.levelNum,
    required this.badge1,
    required this.badge2,
    required this.badge3,
  });
}

Future<MyPageData> receiveMyPageData() async {
  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

  var jsonString = await http.get(
      Uri.parse('https://dev.uksfirstdomain.shop/app/users/${tokenInfo.id}'));
  var resp = jsonDecode(jsonString.body);
  print("receive MyPageData 실행");
  print(resp);
  print(resp['result']);
  print(resp['result']['userName']);


  print("실행전");
  MyPageData myPageData=MyPageData(
    name: resp['result']['userName'],
    secondId: resp['result']['secondId'],
    profileImage:resp['result']['profileImgUrl'],
    level: 'Lv',
    levelNum: resp['result']['userLevel'],
    badge1: '1',
    badge2: '2',
    badge3: '3',
  );
  print("실행 후");
  print(myPageData);

  return myPageData;
}

//TODO 뱃지가 NULL일때 처리해야함 DEFAULT값이 있어야할듯?

// List<MyPageData> myPageData = [
//   MyPageData(
//     name: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     badge1: '1',
//     badge2: '2',
//     badge3: '3',
//   )
// ];