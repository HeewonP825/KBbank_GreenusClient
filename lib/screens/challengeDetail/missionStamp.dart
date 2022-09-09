import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbbank_practice/screens/challengeDetail/userInfo.dart';
import '../../theme.dart';

class MissionStampWidget extends StatelessWidget {
  const MissionStampWidget({Key? key}) : super(key: key);

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
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 50,
            alignment: Alignment.topCenter,
            child: Center(child: Text("이전 페이지에서 미션 이름 받아와야함.", style: textTheme().headline1),),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          UserInfoWidget(),
          Expanded(
              child:
              CbMonthBuilder(
                cbConfig: CbConfig(
                    startDate: DateTime(2022,9,1),
                    endDate: DateTime(2023),
                    selectedDate: DateTime(2022, 9, 9),
                    selectedYear: DateTime(2022),
                    weekStartsFrom: WeekStartsFrom.sunday,
                    highlightedDates: [
                      DateTime(2022, 9, 1),
                      DateTime(2022, 9, 2),
                      DateTime(2022, 9, 4),
                      DateTime(2022, 9, 8),
                    ]),
                monthCustomizer: MonthCustomizer(
                    padding: const EdgeInsets.all(20),
                    monthHeaderCustomizer: MonthHeaderCustomizer(
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    monthButtonCustomizer: MonthButtonCustomizer(
                        currentDayColor: Colors.orange,
                        borderStrokeWidth: 2,
                        textStyleOnDisabled: const TextStyle(color: Colors.red),
                        highlightedColor: const Color.fromARGB(255, 255, 174, 0)),
                    monthWeekCustomizer: MonthWeekCustomizer(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 174, 0)))
                  // monthWidth: 500,
                  // monthHeight: 200
                ),
                yearDropDownCustomizer: YearDropDownCustomizer(
                    yearButtonCustomizer: YearButtonCustomizer(
                      borderColorOnSelected: Colors.red,
                    ),
                    yearHeaderCustomizer: YearHeaderCustomizer(
                        titleTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 174, 0)))),
                    onYearHeaderExpanded: (isExpanded) {
                      print('isExpanded ' + isExpanded.toString());
                },
                onDateClicked: (onDateClicked) {
                  print('selected date' +
                      onDateClicked.selectedDate.toString() +
                      '\n' +
                      'isSelected ' +
                      onDateClicked.isSelected.toString() +
                      '\n' +
                      'isHighlighted ' +
                      onDateClicked.isHighlighted.toString() +
                      '\n' +
                      'hasEvent ' +
                      onDateClicked.hasEvent.toString() +
                      '\n' +
                      'isCurrentDate ' +
                      onDateClicked.isCurrentDate.toString() +
                      '\n' +
                      'isDisabled ' +
                      onDateClicked.isDisabled.toString());
                },
                onYearButtonClicked: (year, isSelected) {
                  print('selected year ' +
                      year.toString() +
                      '\n' +
                      'isSelected ' +
                      isSelected.toString());
                },
              ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: (Icon(Icons.keyboard_return)),
          backgroundColor: Colors.green, //Widget 추가
          onPressed: () {
            // 이벤트 콜백 함수
            Navigator.pop(
              context,
            );
          },
        ));
  }
}
