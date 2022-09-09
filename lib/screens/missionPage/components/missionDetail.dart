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
            child: Text("친구 추가", style: textTheme().headline1),
          ),
          Container(
            height: 95,
            child: Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 20),
              child: ListView(
                // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                scrollDirection: Axis.horizontal,
                // 컨테이너들을 ListView의 자식들로 추가
                children: <Widget>[
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 6, 6, 10),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new Image.network(
                              "https://images.unsplash.com/photo-1497211419994-14ae40a3c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
                              .image,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(13, 5, 20, 0),
            //height: 50,
            alignment: Alignment.topLeft,
            child: Text("미션 설명", style: textTheme().headline1),
          ),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(13, 20, 20, 20),
              child: MissionCustom(),
            ),
          ),
        ],
      ),
    );
  }
}
