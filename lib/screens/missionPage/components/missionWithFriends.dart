import 'dart:convert';
import 'dart:developer';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
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
  // var userId = 1;
  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

  var jsonString = await http.get(
      Uri.parse('https://dev.uksfirstdomain.shop/app/users/${tokenInfo.id}/friends'));
  var resp = jsonDecode(jsonString.body);
  print("친구야~!~!@~!@~!@~!놀자~!@~!");
  print(resp['result']);

  final dataResult = resp['result'];
  List<FriendList> friendList = [];
  for (int i = 0; i < resp['result'].length; i++) {
    friendList.add(FriendList(
      friendId: dataResult[i]['userId'],
      message: dataResult[i]['statusMessage'],
      friendName: dataResult[i]['userName'],
      profileImage: dataResult[i]['profileImgUrl'],
      levelNum: dataResult[i]['userLevel'],
      level: 'Lv',
    ));
  }

  return friendList;
}

class MissionWithFriends extends StatefulWidget {
  List<int> missionFriendIdList;
  List<Map<int, String>> missionFriendList;

  MissionWithFriends(this.missionFriendIdList, this.missionFriendList,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MissionWithFriendsState();
}

class MissionWithFriendsState extends State<MissionWithFriends> {
  late Future<List<FriendList>> futureFriends;
  late List<Map<int, String>> missionFriendList;

  void initState() {
    super.initState();
    futureFriends = receiveFriendsList();
    missionFriendList = widget.missionFriendList;
  }

  void addFriendList(int friendId, String profileUrl) {
    setState(() {
      Map<int, String> friendInfo = {friendId: profileUrl};
      missionFriendList.add(friendInfo);
    });
  }

  void removeFriendList(int friendId, String profileUrl) {
    setState(() {
      for (int i = 0; i < missionFriendList.length; i++) {
        String userIdStr = missionFriendList[i].keys.toString();
        String realUserIdStr = userIdStr.substring(1, userIdStr.length - 1);
        int intUserId = int.parse(realUserIdStr);
        if (intUserId == friendId) {
          missionFriendList.removeAt(i);
          break;
        }
      }
    });
  }

  final ButtonStyle RoundButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xff111421),
    //primary: Colors.black87,
    alignment: Alignment.center,
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
                  style: TextStyle(
                    fontFamily: 'ChangwonDangamAsac',
                    fontSize: 30,
                  ),
                ),
              ),
              body: ListView(
                children: List.generate(snapshot.data?.length ?? 0, (index) {
                  print("is have?");
                  print(widget.missionFriendIdList
                      .contains(snapshot.data![index].friendId));
                  bool isChecked = widget.missionFriendIdList
                      .contains(snapshot.data![index].friendId);
                  return MissionFriendContainer(
                    friendList: snapshot.data![index],
                    onSonChanged:
                        (int friendId, String profileUrl, bool isChecked) {
                      if (isChecked == true) {
                        removeFriendList(friendId, profileUrl);
                      } else {
                        addFriendList(friendId, profileUrl);
                      }
                    },
                    isChecked: isChecked,
                  );
                }),
              ),
              floatingActionButton: ElevatedButton(
                  style: RoundButtonStyle,
                  child: Text('추가하기', style: textTheme().headline2),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false, // 바깥 영역 클릭 시 안닫힘
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('팝업 알림창'),
                            content: SingleChildScrollView(
                                child: ListBody(
                              children: <Widget>[
                                Text('추가하시겠습니까?'),
                              ],
                            )),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('네'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pop(context, missionFriendList);
                                },
                              ),
                              FlatButton(
                                child: Text('아니오'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pop(
                                    context,
                                  );
                                },
                              ),
                            ],
                          );
                        });
                  }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
          // body: Column(
          //
          // ),
        });
  }
}
