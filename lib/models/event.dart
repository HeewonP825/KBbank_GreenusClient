import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;

  Event(@required this.title);

  String toString() => this.title;
}

// Map<DateTime,List<Event>> eventSource={
//   DateTime(2022,9,3):[Event('쓰레기 분리수거하기')],
//   DateTime(2022,8,1):[Event("하 힘들다")],
//   DateTime(2022,8,2):[Event("하 힘들다")],
//   DateTime(2022,8,20):[Event("하 힘들다")],
//   DateTime(2022,8,28):[Event("그만하고싶다.")],
//   DateTime(2022,9,10):[Event("나 그만하면 안될까?")],
//   DateTime(2022,9,5):[Event("아이워너 그만")],
//   DateTime(2022,9,12):[Event('쓰레기 분리수거하기')],
//   DateTime(2022,9,20):[Event('쓰레기 분리수거하기')],
// };


Future<Map<DateTime,List<Event>>> receiveEventSource(groupId) async{
  Map<DateTime,List<Event>> eventSource={};

  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.get('/app/MyMissionMainPage/users/${userId}/groupId/${groupId}');

  print("/app/MyMissionMainPage/users/${userId}/groupId/${groupId}");
  print("stamp 출력");
  print(response.data["result"]);
  print(response.data["result"]['stampDays']);
  final data = response.data["result"]['stampDays'];

  List<DateTime> eventDays = [];

  for (int i = 0; i < data.length; i++) {
    // DateTime datetime=DateTime(2022,09,10);
    print(data[i]['date']);
    var dateStringList=data[i]['date'].split("-");
    print(dateStringList);
    var year=int.parse(dateStringList[0]);
    var month=int.parse(dateStringList[1]);
    var day=int.parse(dateStringList[2]);
    eventSource[DateTime(year,month,day)]=[Event("Stamp")];
  }


  print(22222);

  return eventSource;
}

