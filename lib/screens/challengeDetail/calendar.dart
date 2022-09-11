import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/event.dart';

class Calendar extends StatefulWidget {
  final int groupId;

  const Calendar(this.groupId, {Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<dynamic>> selectedEvents;
  late Future<Map<DateTime, List<Event>>> futureEvents;

  void initState() {
    super.initState();
    futureEvents = receiveEventSource(widget.groupId);
    selectedEvents = {};
  }



  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: receiveEventSource(widget.groupId),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            print('11111');
            print(data);
            final events = LinkedHashMap<DateTime, List<Event>>(
              equals: isSameDay,
            )..addAll(data as Map<DateTime,List<Event>>);

            print(events);
            List<Event> _getEventsForDay(DateTime day) {
              return events[day] ?? [];
            }
            return TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2023),
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: const Color(0xFFC3D9F1),
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: const Color(0xff111421),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }
        });
  }
}
