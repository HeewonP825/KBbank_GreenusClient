import 'package:dio/dio.dart';

class NotificationMessage {

  final int notificationId;
  final String message;
  final int category;


  NotificationMessage({
    required this.notificationId,
    required this.message,
    required this.category,
  });
}


Future<List<NotificationMessage>> receiveNotificationLists() async {
  //Todo userId수정 필요
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response= await dio.get('/app/users/${userId}/notifications');

  print(response);
  print(response.data);
  print(response.data["result"]);
  final data=response.data["result"];

  List<NotificationMessage> NotificationList=[];
  // List<FriendProfile> friendProfileList=[];


  for(int i=0; i<data.length; i++){

    NotificationList.add(NotificationMessage(
      notificationId:data[i]['notificationId'],
      message:data[i]['message'],
      category:data[i]['category'],
    ));
  }

  return NotificationList;
}
