
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/screens/notifications/notificationWidget.dart';

import '../../../models/friendList.dart';
import '../../../theme.dart';
import '../../components/ImageContainer.dart';

typedef void onClickYes();

class SearchFriendContainer extends StatelessWidget {
  final onClickYes onSonChanged;

  SearchFriendContainer({
    Key? key,
    required this.friendList,
    required this.onSonChanged,
  }) : super(key: key);

  final FriendList friendList;
  late Widget btn;

  @override
  Widget build(BuildContext context) {
    print("Friend List build start");
    print(friendList.isFriend);
    print(friendList.hasRequest);
    print(friendList.sendRequest);
    if(friendList.isFriend==1){
      btn=SizedBox();
    }else if(friendList.hasRequest==1){
      btn=Expanded(
          child: ElevatedButton(
            child: Text("친구 승인"),
            onPressed: () async{
              print("하핳 클릭됐다!~");
               await acceptFriendRequest(friendList.notificationId!);
              onSonChanged();
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff111421)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xff111421))
                    )
                )
            ),
          )
      );
    }else if(friendList.sendRequest==1){
      btn=Expanded(
          child: ElevatedButton(
            child: Text("친구 요청중"),
            onPressed: (){
              print("하핳 클릭됐다!~");
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xff111421))
                    )
                )
            ),
          )
      );
    }else{
      btn=Expanded(
          child: ElevatedButton(
            child: Text("친구 요청"),
            onPressed: () async{
              print("친구요청!~");
              await requestFriend(1,friendList.secondId!);
              onSonChanged();
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff111421)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xff111421))
                    )
                )
            ),
          )
      );
    }

    return GestureDetector(
      onTap: (){
        print("클릭");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.  white,
        ),
        margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
        height: 96,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              ImageContainer(
                width: 55,
                height: 55,
                borderRadius: 27.5,
                imageUrl: friendList.profileImage,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: friendList.level),
                        TextSpan(text: friendList.levelNum.toString()),
                      ]),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          friendList.friendName,
                          style: textTheme().headline1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                            " #"+friendList.secondId.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff646361),
                            ),
                            overflow: TextOverflow.ellipsis,

                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      friendList.message,
                      style: textTheme().subtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              btn,
            ],
          ),
        ),
      ),
    );
  }
}

Future<Response> requestFriend(int userId,int friendCode) async {
  var userId = 1; //TODO 바꿔야함.

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response =
  await dio.post('/app/user/friendRequest', data: {
    "userId":userId,
    "friendcode": friendCode,
  });

  print(response);
  return response;
}