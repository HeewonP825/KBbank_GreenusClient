import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/friendList.dart';
import 'components/friendContainer.dart';
import '../components/ImageContainer.dart';
import '../components/appBarPrefferedSize.dart';
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

class FriendWidget extends StatefulWidget{
  const FriendWidget({Key?key}):super(key:key);

  @override
  State<StatefulWidget> createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget>{
 late Future<List<FriendList>> futureFriends;

 void initState() {
   super.initState();
   futureFriends=receiveFriendsList();
 }

  @override
  Widget build(BuildContext context) {
    // final List<FriendList> friendList=receiveFriendsList();

    return FutureBuilder<List<FriendList>>(
      future: futureFriends,
      builder: (context, snapshot) {
        var data = snapshot.data;
        print("친구야`!~@! 잘 놀았다~!@~!2");
        print(data);
        if(data==null){
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          return Scaffold(
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            //   title: Text(
            //     "GREENUS",
            //     style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
            //   ),
            // ),
            body: ListView(
              children: List.generate(
                snapshot.data?.length ?? 0,
                    (index) => FriendContainer(friendList: snapshot.data![index]),
              ),
            ),
          );
        }
      //   if(snapshot.hasError) {
      //     return Center(child: Text(snapshot.error.toString()));
      //   }
      //   if (!snapshot.hasData) {
      //     return Center(child: CircularProgressIndicator());
      // }

      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Text(
    //       "GREENUS",
    //       style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
    //     ),
    //   ),
    //   body: ListView(
    //     children: List.generate(
    //       futureFriends.length,
    //           (index) => FriendContainer(friendList: futureFriends[index]),
    //     ),
    //   ),
    // );
  }
}