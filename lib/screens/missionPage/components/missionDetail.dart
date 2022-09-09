import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeList/components/ingMission.dart';
import 'package:kbbank_practice/screens/missionPage/newMissionList.dart';
import 'missionList.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'missionCustom.dart';

import '../../../../theme.dart';

class MissionDetail extends StatefulWidget {
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
  late DateTime _start, _end,_today;

  @override
  void initState() {
    _controller = DateRangePickerController();
    _startDate = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(DateTime.now().add(Duration(days: 3)))
        .toString();
    _today=DateTime.now();
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "GREENUS",
          style: GoogleFonts.pacifico(fontSize: 20, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (Icon(Icons.keyboard_return)),
        backgroundColor: Colors.green, //Widget 추가
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
            child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.", style: textTheme().headline1),),
            decoration: BoxDecoration(
              color: Color(0xFFE6EFE4),
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
                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),

                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayCellDecoration:
                    BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1,
                          color: Colors.green,
                      ),
                    ),
                ),

                selectionTextStyle: const TextStyle(color: Colors.white),
                selectionColor: Colors.green,
                startRangeSelectionColor: Colors.green,
                endRangeSelectionColor: Colors.green,
                rangeSelectionColor: Color(0xFFE6EFE4),
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
                Icon(Icons.add_circle_outline_rounded),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(13, 5, 20, 0),
            //height: 50,
            alignment: Alignment.topLeft,
            child: Text("미션 설명", style: textTheme().headline1,),
          ),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(13, 20, 20, 20),
              child: MissionCustom(),
            ),
          ),
          Container(

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
                          )
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('네'),
                            onPressed: () {
                              Navigator.of(context).pop();
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
                    }
                  );
                }
            ),
        ],
      ),
    );
  }
}
