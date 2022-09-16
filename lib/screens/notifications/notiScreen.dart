import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/notification.dart';
import 'package:kbbank_practice/screens/notifications/notificationWidget.dart';

class NotiScreen extends StatefulWidget {
  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  late Future<List<NotificationMessage>> futureNotifications;
  List<Widget> NotificationWidgetList = [];

  void initState() {
    super.initState();
    futureNotifications = receiveNotificationLists();
  }

  void updateNotifications(){
    setState(() {
      futureNotifications=receiveNotificationLists();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "GREENUS",
          style: TextStyle(
            fontFamily: 'ChangwonDangamAsac',
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
          future: futureNotifications,
          builder: (context, snapshot) {
            var data = snapshot.data;
            print("여기 실행은 되니?");
            print("된다고 해줘 제바루");
            print("뭐가 뜨긴 해야지?");


            if (data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              print("2번버전");
              print("여기 실행은 되니?");
              print("된다고 해줘 제바루");
              print("뭐가 뜨긴 해야지?");
              print(data);
              NotificationWidgetList=convertWidgetList(data as List<NotificationMessage>,updateNotifications);
              return ListView(children: NotificationWidgetList);
            }
          }),
    );

    return Container(
      child: Text("IngMission Screen"),
    );
  }
}

List<NotificationWidget> convertWidgetList(List<NotificationMessage> notifications,updateNotifications){
  List<NotificationWidget> widgetList=[];

  for(int i=0; i<notifications.length; i++){
    widgetList.add(
        NotificationWidget(
            notifications[i],
            onSonChanged:(){
              updateNotifications();
            }
    ));
  }

  return widgetList;
}
