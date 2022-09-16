import 'package:carousel_slider/carousel_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/models/friendList.dart';
import 'package:kbbank_practice/models/missionInfo.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import 'package:kbbank_practice/screens/missionPage/components/missionWithFriends.dart';
import 'package:kbbank_practice/screens/missionPage/newMissionList.dart';
import 'missionList.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'missionCustom.dart';

import '../../../../theme.dart';

class MissionDetail extends StatefulWidget {
  MissionInfo missionInfo;

  MissionDetail(this.missionInfo, {Key? key}) : super(key: key);

  @override
  MissionDetailState createState() => MissionDetailState();
}

class MissionDetailState extends State<MissionDetail> {
  // String _selectedDate = '';
  // String _dateCount = '';
  // String _range = '';
  // String _rangeCount = '';

  late String _startDate, _endDate;
  late DateRangePickerController _controller;
  late DateTime _start, _end, _today;
  late Future<List<FriendList>> futureFriends;
  late String N = '일주일';
  late String M = '한 번';

  List<Map<int, String>> missionFriendList = [];
  List<int> missionFriendIdList = [];
  List<Widget> missionFriendProfileList = [];

  @override
  void initState() {
    _controller = DateRangePickerController();
    _startDate = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(DateTime.now().add(Duration(days: 3)))
        .toString();
    _today = DateTime.now();
    _start = _today;
    _end = _today.add(Duration(days: 3));
    _controller.selectedRange = PickerDateRange(_start, _end);
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
      _endDate =
          DateFormat('dd, MMMM yyyy').format(args.value.endDate).toString();
    });
  }

  final ButtonStyle RoundButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xff111421),
    //primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    elevation: 5,
    // shape
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(27.5),
    ),
  );

  void updatePeriodAndCount(String period, String count) {
    setState(() {
      N = period;
      M = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.selectedRange?.startDate);
    print(_controller.selectedRange?.endDate);
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
      floatingActionButton: FloatingActionButton(
        child: (Icon(Icons.keyboard_return)),
        backgroundColor: Color(0xff111421), //Widget 추가
        onPressed: () {
          // 이벤트 콜백 함수
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => NewMissionList()),
          );
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(
              child: Text(widget.missionInfo.missionName,
                  style: textTheme().headline1),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFC3D9F1),
              border: Border.all(
                width: 1.5,
                color: Color(0xffffffff),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.35),
                  spreadRadius: 1.7,
                  blurRadius: 1.2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(13, 15, 20, 0),
          //   //height: 50,
          //   alignment: Alignment.topLeft,
          //   child: Text("미션 수행 기간", style: textTheme().headline1),
          // ),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(13, 10, 20, 20),
              child: SfDateRangePicker(
                monthFormat: 'MM',
                view: DateRangePickerView.month,
                controller: _controller,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: selectionChanged,
                allowViewNavigation: false,
                monthViewSettings:
                    DateRangePickerMonthViewSettings(firstDayOfWeek: 1),

                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayCellDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Color(0xff111621),
                    ),
                  ),
                ),

                selectionTextStyle: const TextStyle(color: Colors.white),
                selectionColor: Colors.blueGrey,
                startRangeSelectionColor: Colors.blueGrey,
                endRangeSelectionColor: Colors.blueGrey,
                rangeSelectionColor: Color(0xFFC3D9F1),
                //rangeTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(13, 5, 20, 0),
            //height: 50,
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text("친구 추가", style: textTheme().headline1),
                InkWell(
                  onTap: () async {
                    var getmissionFriendIdList = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MissionWithFriends(
                              missionFriendIdList, missionFriendList)),
                    );
                    setState(() {
                      missionFriendList = getmissionFriendIdList;
                      missionFriendIdList = [];
                      missionFriendProfileList = [];
                      print("여기 왜 실행안됨?");
                      for (int i = 0; i < missionFriendList.length; i++) {
                        String profileUrl =
                            missionFriendList[i].values.toString();
                        String realUrl =
                            profileUrl.substring(1, profileUrl.length - 1);
                        String id = missionFriendList[i].keys.toString();
                        String realIdStr = id.substring(1, id.length - 1);
                        int friendId = int.parse(realIdStr);
                        print(realUrl);
                        missionFriendIdList.add(friendId);
                        missionFriendProfileList.add(
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 10, 6, 10),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new Image.network(realUrl).image,
                              ),
                            ),
                          ),
                        );
                      }
                      print(missionFriendProfileList);
                    });
                  },
                  child: Icon(Icons.add_circle_outline_rounded),
                ),
              ],
            ),
          ),
          Row(
            children: missionFriendProfileList,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(13, 5, 20, 0),
            //height: 50,
            alignment: Alignment.topLeft,
            child: Text(
              "미션 설명",
              style: textTheme().headline1,
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MissionCustom(onSonChanged: (String period, String count) {
                    updatePeriodAndCount(period, count);
                  }),
                  Text(widget.missionInfo.descriptionComment1),
                  Text(widget.missionInfo.descriptionComment2),
                ],
              ),
            ),
          ),

          ElevatedButton(
              style: RoundButtonStyle,
              child: Text('생성하기', style: textTheme().headline2),
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
                            Text('생성하시겠습니까?'),
                          ],
                        )),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('네'),
                            onPressed: () async {
                              var groupId = await postMyMission(widget
                                  .missionInfo
                                  .missionId); //Todo 이거 missionId 바꿔야함.
                              print("첫번째 api호출 완료");
                              print(groupId);

                              for (int i = 0;
                                  i < missionFriendIdList.length;
                                  i++) {
                                await postMyMissionFriends(
                                    groupId, missionFriendIdList[i]);
                              }

                              print("여기까진 진짜로 옴");
                              await postMyMissionRule(groupId, N, M);
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('아니오'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}

Future<int> postMyMission(int missionId) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.post('/app/MyMission/${missionId}');

  print(response.data['result']['groupId']);
  int groupId = response.data['result']['groupId'];

  return groupId;
}

Future<Response> postMyMissionFriends(groupId, friendId) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response =
      await dio.post('/app/group/${groupId}/missionWithFriend', data: {
    "friendId": friendId,
  });

  print(response);
  return response;
}

Future<Response> postMyMissionRule(groupId, period, count) async {
  var userId = 1;

  var options = BaseOptions(
    baseUrl: 'https://dev.uksfirstdomain.shop',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);
  Response response = await dio.post('/app/missionRule', data: {
    "groupId": groupId,
    "day": period,
    "number": count,
  });

  print(response);
  return response;
}
