import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/notification.dart';
import 'package:kbbank_practice/screens/components/ImageContainer.dart';
import 'package:kbbank_practice/theme.dart';

typedef void onClickYes();
class NotificationWidget extends StatelessWidget {
  final onClickYes onSonChanged;
  final NotificationMessage notification;

  NotificationWidget(this.notification, {Key? key,required this.onSonChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl;
    switch(notification.category){
      case 0: //친구요청
        imgUrl='assets/images/friendRequest.png';
        break;
      case 1: // 친구 승락
        imgUrl='assets/images/friendApply.png';
        break;
      case 2: // 친구가 좋아요를 눌렀어요
        imgUrl='assets/images/heart.png';
        break;
      case 3: // 친구가 인증을 올렸어요
        imgUrl='assets/images/feed.png';
        break;
      default:
        imgUrl='assets/images/heart.png';
        break;
    }
    if(notification.category==0){
      return GestureDetector(
        onTap:(){
          showDialog(
              context: context,
              barrierDismissible: false, // 바깥 영역 클릭 시 안닫힘
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('팝업 알림창'),
                  content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('친구요청을 승락하시겠습니까?'),
                        ],
                      )),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('네'),
                      onPressed: () async {
                        // var groupId = await postMyMission(widget
                        //     .missionInfo
                        //     .missionId);
                        await acceptFriendRequest(notification.notificationId);
                        print("네!!");
                        Navigator.of(context).pop();
                        onSonChanged();
                      },
                    ),
                    FlatButton(
                      child: Text('아니오'),
                      onPressed: () {
                        print("아니요!!!");
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    imgUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    notification.message,
                    style: textTheme().subtitle1,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }else{
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imgUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  notification.message,
                  style: textTheme().subtitle1,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    }

  }
}

Future<Response> acceptFriendRequest(int notificationId) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response =
  await dio.post('/app/friendAcceptance', data: {
    "notificationId": notificationId,
  });

  print(response);
  return response;
}