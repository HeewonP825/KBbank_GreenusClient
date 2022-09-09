import 'package:flutter/material.dart';

class Event {
  final String title;

  Event(@required this.title);

  String toString() => this.title;
}

Map<DateTime,List<Event>> eventSource={
  DateTime(2022,9,3):[Event('쓰레기 분리수거하기')],
  DateTime(2022,8,1):[Event("하 힘들다")],
  DateTime(2022,8,2):[Event("하 힘들다")],
  DateTime(2022,8,20):[Event("하 힘들다")],
  DateTime(2022,8,28):[Event("그만하고싶다.")],
  DateTime(2022,9,10):[Event("나 그만하면 안될까?")],
  DateTime(2022,9,5):[Event("아이워너 그만")],
  DateTime(2022,9,12):[Event('쓰레기 분리수거하기')],
  DateTime(2022,9,20):[Event('쓰레기 분리수거하기')],
};