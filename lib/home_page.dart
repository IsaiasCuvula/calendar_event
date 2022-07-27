import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'leave_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  DateTime _stringToDateTimeObject(String dateString) {
    DateFormat format = DateFormat('yyyy-MM-dd');
    return format.parse(dateString);
  }

  @override
  Widget build(BuildContext context) {
    final List<LeaveData> events = [];
    final List<Color> colors = [
      Colors.pink,
      Colors.yellow,
      Colors.purpleAccent,
      Colors.orange,
      Colors.pink,
    ];
    final List<Map<String, String>> leaves = LeaveModel.dummyData['data'];

    for (var leave in leaves) {
      events.add(LeaveData.fromJson(leave));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Leaves Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2022),
            lastDay: DateTime(2060),
            onPageChanged: (DateTime date) {
              //
            },
            onFormatChanged: (format) {
              //
            },
            onDaySelected: (selectedTime, focusedTime) {
              //
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (ctx, day, focusedDay) {
                int index = 0;
                for (LeaveData leaveEvent in events) {
                  index++;
                  final DateTime event = _stringToDateTimeObject(
                    leaveEvent.calenderDate!,
                  );
                  if (day.day == event.day &&
                      day.month == event.month &&
                      day.year == event.year) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Center(
                          child: Text('${day.day}'),
                        ),
                      ),
                    );
                  }
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
