import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';

import '../../../../models/orderModel.dart';

class SheduleDateProvider extends ChangeNotifier {
  int current = 0;
  OrderModelTest order = OrderModelTest();

  PageController pageController = PageController();

  List<String> items = [
    "Date",
    "Time",
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.explore,
  ];

  List<Object> times = [
    {"time": "10:30:00", "charge": 1},
    {"time": "11:30:00", "charge": 0},
    {"time": "14:30:00", "charge": 0},
    {"time": "15:30:00", "charge": 0},
    {"time": "14:30:00", "charge": 1}
  ];

  void initFunctionShedule() {
    order.name = "Hello";
    order.phoneNumber = "012345";
    order.pickupLocation = "KTC";
    order.deliveryCentre = "OPC";
    order.parcels = [ParcelModel("01jaksd")];
  }

  void disposeFunction() {
    pageController.dispose();
  }

  void changeTabShedule(int index) {
    current = index;
    order.selectedDate!;
    notifyListeners();
    pageController.animateToPage(
      current,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void updateSelectedDate(DateTime selectedDate) {
    order.selectedDate = selectedDate;
    notifyListeners();
  }

  bool initialTimeSelect = false;
  void changeInitalTime() {
    initialTimeSelect = true;
    notifyListeners();
  }

  int selectedTimeIndex = -1;
  bool selectedTime = false;
  TimesAvailable? selectedTimeValue;
  void selectTimes(int value, TimesAvailable time) {
    print(value.toString() + selectedTimeIndex.toString());
    if (selectedTimeIndex == value) {
      selectedTimeIndex = value;
      selectedTimeValue = time;
      selectedTime = true;
      initialTimeSelect = true;
    } else if (initialTimeSelect) {
      selectedTimeIndex = value;
      selectedTimeValue = time;
      selectedTime = true;
      initialTimeSelect = false;
    }
    notifyListeners();
  }
}
