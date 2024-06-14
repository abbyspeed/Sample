import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget{
  CustomCalendar({super.key, required this.order});

  final OrderModelTest order;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> with AutomaticKeepAliveClientMixin<CustomCalendar> {
  DateTime today = DateTime.now();
  DateTime? _selectedDate;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay){
    if(!isSameDay(_selectedDate, day)){
      setState(() {
        _selectedDate = day;
        widget.order.selectedDate = _selectedDate;
        print(widget.order.selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      height: 400,
      child: TableCalendar(
        locale: "en_US",
        focusedDay: today,
        firstDay: today,
        lastDay: DateTime.utc(2024, 7, 31),
        rowHeight: 50,
        headerStyle: HeaderStyle(
          headerMargin: EdgeInsets.only(bottom: 20),
          headerPadding: EdgeInsets.zero,
          titleCentered: true,
          formatButtonVisible: false,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColour,
              width: 1.0
            ),
            borderRadius: BorderRadius.circular(10)
          )
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.zero
          ),
          todayTextStyle: TextStyle(
            color: primaryColour
          ),
          selectedDecoration: BoxDecoration(
            color: secondaryColour,
            // borderRadius: BorderRadius.circular(10)
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.black
          )
        ),
        onDaySelected: _onDaySelected,
        onPageChanged:(focusedDay) {
          _selectedDate = focusedDay;
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
      ),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}