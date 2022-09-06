import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'FriendProfile.dart';

class IngMissionData {

  final String missionName;
  final String backgroundImage;
  final String startDate;
  final List<FriendProfile> friendProfileList;

  IngMissionData({
    required this.missionName,
    required this.backgroundImage,
    required this.startDate,
    required this.friendProfileList,
  });
}

Future<List<IngMissionData>> receiveIngMissionData() async {
  print("뭐가됐든 여기 들어오긶 ㅏㄴ거겠지?");
  ///:userId
  var userId = 1;
  print("진행중 미션 response1");

  print("진행중 미션 response2");
  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response= await dio.get('/app/MyMissionLists/${userId}', queryParameters: {
    'status': 'onGoing'
  });

  print("진행중 미션 response3");
  print(response);
  print(response.data);
  print(response.data["result"]);
  final data=response.data["result"];

  List<IngMissionData> ingMissionLists=[];
  List<FriendProfile> friendProfileList=[];

  print("friends");
  print(data[0]['friends'].runtimeType);
  print(data[0]['friends'][0]['profileImgUrl']);

  for(int i=0; i<data.length; i++){
    for(int j=0; j<data[i]['friends'].length; j++){
      friendProfileList.add(
        FriendProfile(profileUrl: data[i]['friends'][j]['profileImgUrl'])
      );
    }
    ingMissionLists.add(IngMissionData(
      missionName: data[i]['missionName'],
      backgroundImage: "assets/images/banner1.jpg",
      startDate: data[i]['startDate'],
      friendProfileList: friendProfileList,
    ));
  }

  return ingMissionLists;
}
