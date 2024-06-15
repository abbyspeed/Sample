// import 'package:architech/config/theme.dart';
// import 'package:architech/models/orderModel.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class CustomCalendar extends StatefulWidget {
//   CustomCalendar({super.key, required this.order});
//
//   final OrderModelTest order;
//
//   @override
//   _CustomCalendarState createState() => _CustomCalendarState();
// }
//
// class _CustomCalendarState extends State<CustomCalendar>
//     with AutomaticKeepAliveClientMixin<CustomCalendar> {
//   DateTime today = DateTime.now();
//   DateTime? _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   void _onDaySelected(DateTime day, DateTime focusedDay) {
//     if (!isSameDay(_selectedDate, day)) {
//       setState(() {
//         _selectedDate = day;
//         widget.order.selectedDate = _selectedDate;
//         print(widget.order.selectedDate);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//
//     return SizedBox(
//       height: 400,
//       child: TableCalendar(
//         locale: "en_US",
//         focusedDay: today,
//         firstDay: today,
//         lastDay: DateTime.utc(2024, 7, 31),
//         rowHeight: 50,
//         headerStyle: HeaderStyle(
//             headerMargin: EdgeInsets.only(bottom: 20),
//             headerPadding: EdgeInsets.zero,
//             titleCentered: true,
//             formatButtonVisible: false,
//             decoration: BoxDecoration(
//                 border: Border.all(color: primaryColour, width: 1.0),
//                 borderRadius: BorderRadius.circular(10))),
//         calendarStyle: CalendarStyle(
//             todayDecoration: const BoxDecoration(
//               color: Colors.white,
//               // borderRadius: BorderRadius.zero
//             ),
//             todayTextStyle: TextStyle(color: primaryColour),
//             selectedDecoration: BoxDecoration(
//               color: secondaryColour,
//               // borderRadius: BorderRadius.circular(10)
//             ),
//             selectedTextStyle: const TextStyle(color: Colors.black)),
//         onDaySelected: _onDaySelected,
//         onPageChanged: (focusedDay) {
//           _selectedDate = focusedDay;
//         },
//         selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
import 'package:architech/models/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../config/theme.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    required this.order,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  final OrderModelTest order;
  final DateTime initialDate;
  final ValueChanged<DateTime?> onDateSelected;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar>
    with AutomaticKeepAliveClientMixin<CustomCalendar> {
  DateTime today = DateTime.now();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(_selectedDate, day) && !day.isBefore(today)) {
      setState(() {
        _selectedDate = day;
        widget.order.selectedDate = _selectedDate ?? DateTime.now();
        widget.onDateSelected(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: 400,
      child: TableCalendar(
        locale: "en_US",
        focusedDay: today,
        firstDay: today,
        lastDay: DateTime.utc(2024, 7, 31),
        rowHeight: 50,
        headerStyle: HeaderStyle(
          headerMargin: const EdgeInsets.only(bottom: 20),
          headerPadding: EdgeInsets.zero,
          titleCentered: true,
          formatButtonVisible: false,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColour, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.white,
          ),
          todayTextStyle: TextStyle(color: primaryColour),
          selectedDecoration: BoxDecoration(
            color: secondaryColour,
          ),
          selectedTextStyle: const TextStyle(color: Colors.black),
          disabledTextStyle: const TextStyle(
              color: Colors.grey), // Optional: Style for disabled dates
        ),
        onDaySelected: _onDaySelected,
        onPageChanged: (focusedDay) {
          _selectedDate = focusedDay;
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        enabledDayPredicate: (day) {
          return !day.isBefore(today); // Disable past dates
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// import 'package:architech/config/theme.dart';
// import 'package:architech/models/orderModel.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CustomCalendar extends StatefulWidget {
//   CustomCalendar({
//     Key? key,
//     required this.order,
//     required this.initialDate,
//     required this.onDateSelected,
//   }) : super(key: key);
//
//   final OrderModelTest order;
//   final DateTime initialDate;
//   final Function(DateTime?) onDateSelected;
//
//   @override
//   _CustomCalendarState createState() => _CustomCalendarState();
// }
//
// class _CustomCalendarState extends State<CustomCalendar>
//     with AutomaticKeepAliveClientMixin<CustomCalendar> {
//   late DateTime today;
//   DateTime? _selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     today = widget.initialDate;
//     _selectedDate = widget.initialDate;
//   }
//
//   void _onDaySelected(DateTime day, DateTime focusedDay) {
//     if (!isSameDay(_selectedDate, day)) {
//       setState(() {
//         _selectedDate = day;
//         widget.order.selectedDate = _selectedDate ?? DateTime.now();
//       });
//       widget.onDateSelected(_selectedDate);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//
//     return SizedBox(
//       height: 400,
//       child: TableCalendar(
//         locale: "en_US",
//         focusedDay: today,
//         firstDay: DateTime.utc(2020, 1, 1),
//         lastDay: DateTime.utc(2024, 7, 31),
//         rowHeight: 50,
//         headerStyle: HeaderStyle(
//           headerMargin: const EdgeInsets.only(bottom: 20),
//           headerPadding: EdgeInsets.zero,
//           titleCentered: true,
//           formatButtonVisible: false,
//           decoration: BoxDecoration(
//             border: Border.all(color: primaryColour, width: 1.0),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         calendarStyle: CalendarStyle(
//           todayDecoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           todayTextStyle: TextStyle(color: primaryColour),
//           selectedDecoration: BoxDecoration(
//             color: secondaryColour,
//           ),
//           selectedTextStyle: const TextStyle(color: Colors.black),
//         ),
//         onDaySelected: _onDaySelected,
//         onPageChanged: (focusedDay) {
//           today = focusedDay;
//         },
//         selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
