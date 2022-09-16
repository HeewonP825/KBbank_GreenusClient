import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'FriendProfile.dart';

class IngMissionData {

  final int groupId;
  final String missionName;
  final String backgroundImage;
  final String startDate;
  final List<FriendProfile> friendProfileList;

  IngMissionData({
    required this.groupId,
    required this.missionName,
    required this.backgroundImage,
    required this.startDate,
    required this.friendProfileList,
  });
}

Future<List<IngMissionData>> receiveIngMissionData() async {
  //Todo userId수정 필요
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response= await dio.get('/app/MyMissionLists/${userId}', queryParameters: {
    'status': 'onGoing'
  });

  print(response);
  print(response.data);
  print(response.data["result"]);
  final data=response.data["result"];

  List<IngMissionData> ingMissionLists=[];
  List<FriendProfile> friendProfileList=[];

  print("friends");
  print(data[0]['friends'].runtimeType);

  for(int i=0; i<data.length; i++){
    friendProfileList=[];
    for(int j=0; j<data[i]['friends'].length; j++){
      friendProfileList.add(
        FriendProfile(profileUrl: data[i]['friends'][j]['profileImgUrl'])
      );
    }
    ingMissionLists.add(IngMissionData(
      groupId: data[i]['groupId'],
      missionName: data[i]['missionName'],
      backgroundImage: data[i]['category']==0? "assets/images/mission.png":"assets/images/mission1.png" ,
      startDate: data[i]['startDate'],
      friendProfileList: friendProfileList,
    ));
  }

  return ingMissionLists;
}
