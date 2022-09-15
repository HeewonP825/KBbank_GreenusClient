import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class FriendList {
  final int friendId;
  final String friendName;
  final String profileImage;
  final String level;
  final int levelNum;
  final String message;

  FriendList({
    required this.friendId,
    required this.friendName,
    required this.profileImage,
    required this.level,
    required this.levelNum,
    required this.message,
  });
}


//
// Future<List<FriendList>> receiveFriendsList() async {
//
//   ///:userId
//   var userId = 12;
//
//   var jsonString = await http.get(
//       Uri.parse('https://dev.uksfirstdomain.shop/app/users/${userId}/friends'));
//   var resp = jsonDecode(jsonString.body);
//   print(resp[0]);
//   print(resp[0]['userName']);
//
//
//   List<FriendList> friendList=[
//     FriendList(
//     friendName: resp[0]['userName'],
//     profileImage: resp[0]['profileImgUrl'],
//     level: 'Lv',
//     levelNum: resp[0]['userLevel'],
//     message: resp[0]['statusMessage'],
//   )];
//   return friendList;
// }
//
// // 샘플 데이터
// List<FriendList> friendList = [
//   FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),FriendList(
//     friendName: '그리너',
//     profileImage: "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
//     level: 'Lv',
//     levelNum: 3,
//     message: '',
//   ),
// ];