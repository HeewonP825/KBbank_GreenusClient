import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotiScreen extends StatefulWidget {
  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  // late Future<List<FriendList>> futureNotifications;

  void initState() {
    super.initState();
    // futureNotifications=receiveNotificationLists();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "GREENUS",
              style: TextStyle(fontFamily: 'ChangwonDangamAsac', fontSize: 30,),
            ),
          ),
      // body: FutureBuilder(
      //           future: futureNotifications,
      //           builder: (context, snapshot) {
      //           var data = snapshot.data;
      //           print("친구야`!~@! 잘 놀았다~!@~!2");
      //           print(data);
      //           if(data==null){
      //           return Container(
      //           child: Center(
      //           child: CircularProgressIndicator(),
      //           ),
      //           );
      //           }else{
      //             ListView(
      //                 children: List.generate(
      //                 snapshot.data?.length ?? 0,
      //                 (index) => FriendContainer(friendList: snapshot.data![index]),
      //             ),
      //           }
      //         }
      //         ),
        );

    return Container(child: Text("IngMission Screen"),
    );
  }
}