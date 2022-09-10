import 'dart:convert';
import 'package:kbbank_practice/screens/missionPage/components/missionFriendContainer.dart';

import '../../../../theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/friendList.dart';
import '../../friendlist/components/friendContainer.dart';
import '../../components/ImageContainer.dart';
import '../../components/appBarPrefferedSize.dart';
import 'missionDetail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<FriendList>> receiveFriendsList() async {
  var userId = 12;

  var jsonString = await http.get(
      Uri.parse('https://dev.uksfirstdomain.shop/app/users/${userId}/friends'));
  var resp = jsonDecode(jsonString.body);
  print("친구야~!~!@~!@~!@~!놀자~!@~!");
  print(resp['result']);

  final dataResult=resp['result'];
  List<FriendList> friendList=[];
  for(int i=0; i<resp['result'].length;i++){

    friendList.add(FriendList(
      message: dataResult[i]['statusMessage'],
      friendName: dataResult[i]['userName'],
      profileImage: dataResult[i]['profileImgUrl'],
      levelNum: dataResult[i]['userLevel'],
      level: 'Lv',
    ));
  }

  return friendList;
}

class MissionWithFriends extends StatefulWidget{
  const MissionWithFriends({Key?key}):super(key:key);

  @override
  State<StatefulWidget> createState() => MissionWithFriendsState();
}

class MissionWithFriendsState extends State<MissionWithFriends>{
  late Future<List<FriendList>> futureFriends;

  void initState() {
    super.initState();
    futureFriends=receiveFriendsList();
  }

  final ButtonStyle RoundButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.green,
    //primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    elevation: 5,
    // shape
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(27.5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // final List<FriendList> friendList=receiveFriendsList();

    return FutureBuilder<List<FriendList>>(
        future: futureFriends,
        builder: (context, snapshot) {
          var data = snapshot.data;
          print("친구야`!~@! 잘 놀았다~!@~!2");
          print(data);
          if (data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "GREENUS",
                  style: GoogleFonts.pacifico(
                      fontSize: 20, color: Colors.white),
                ),
              ),
              body: ListView(
                children: List.generate(
                  snapshot.data?.length ?? 0,
                      (index) =>
                      MissionFriendContainer(friendList: snapshot.data![index]),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: (Icon(Icons.keyboard_return)),
                backgroundColor: Colors.green, //Widget 추가
                onPressed: () { // 이벤트 콜백 함수
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => MissionDetail()),
                  );
                },
              ),
            );
          }
        }
    );
  }
}