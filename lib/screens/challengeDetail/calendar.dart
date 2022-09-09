import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/event.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<dynamic>> selectedEvents;


  final events = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
  )..addAll(eventSource);

  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime(2022),
      lastDay: DateTime(2023),
      eventLoader: (day) {
        return _getEventsForDay(day);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: const Color(0xFFCBF1C3),
          shape: BoxShape.circle,
        ),
        markerDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        markerSize:20,
      ),
    );
  }
}
