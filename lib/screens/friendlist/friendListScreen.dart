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
  print(resp[0]);
  print(resp[0]['userName']);

  List<FriendList> friendList=[];
  for(int i=0; i<resp.length;i++){

    friendList.add(FriendList(
      message: resp[i]['statusMessage'],
      friendName: resp[i]['userName'],
      profileImage: resp[i]['profileImgUrl'],
      levelNum: resp[i]['userLevel'],
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
    //final List<FriendList> friendList=await receiveFriendsList();

    return FutureBuilder<List<FriendList>>(
      future: futureFriends,
      builder: (context, snapshot) {
      //   if(snapshot.hasError) {
      //     return Center(child: Text(snapshot.error.toString()));
      //   }
      //   if (!snapshot.hasData) {
      //     return Center(child: CircularProgressIndicator());
      // }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "GREENUS",
              style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
            ),
          ),
          body: ListView(
            children: List.generate(
              snapshot.data?.length ?? 0,
                  (index) => FriendContainer(friendList: snapshot.data![index]),
            ),
          ),
        );
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