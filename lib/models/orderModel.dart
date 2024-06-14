import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderModelTest extends ChangeNotifier{
  late String orderId, name, phoneNumber, pickupLocation, deliveryCentre, selectedPayment;
  late String status = "Order is placed";
  DateTime? selectedDate;
  late DateTime selectedTime;
  late List<ParcelModel> parcels = [];
  double parcelPrice = 1.00;
  double centrePrice = 1.00;
  late double totalPaid;

  // Mock Data
  OrderModelTest(){
    orderId = "1";
    name = "Mariam Suriya";
    phoneNumber = "0198762371";
    pickupLocation = "KTC B01";
    deliveryCentre = "OPC";
    selectedPayment = "COD";
    selectedDate = DateTime.now();
    selectedTime = DateTime.now();
    parcels = [
      ParcelModel("MP1234"),
      ParcelModel("UI7923")
    ];
  }

  // List<double> extraCharge = [];

  // TODO: Generate random or reference id for orderId before submitting

  // Testing
  final times = [
    TimesAvailable("10:30:00", 1),
    TimesAvailable("11:30:00", 0),
    TimesAvailable("14:30:00", 0),
  ];

  double totalPrice(){
    parcelPrice = parcels.length * 1;
    centrePrice = parcels.length * 1;

    return totalPaid = parcelPrice + centrePrice;
  }

  // To be updated
  String updateStatus(){
    return status;
  }
  
  dateConverter(bool toString){
    DateFormat dateFormat = DateFormat("dd MMM yyyy");

    if(toString == true){
      return dateFormat.format(selectedDate!);

    }else{
      // To be changed
      return dateFormat.parse("05:30");
    }
  }

  timeConverter(bool toString, String? time2){
    DateFormat timeFormat = DateFormat();

    if(toString == true){
      return timeFormat.add_jm().format(selectedTime);

    }else{
      return timeFormat.parse(time2!);
    }
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNumber": phoneNumber,
    "pickupLocation": pickupLocation,
    "deliveryCentre": deliveryCentre,
    "parcels": parcels,
    "selectedDate": selectedDate,
    "selectedTime": selectedTime,
    "selectedPayment": selectedPayment,
    "totalPaid": 6,
    "status": status,
  };
}

class TimesAvailable{
  TimesAvailable(this.time, this.extraCharge);

  final String time;
  final double extraCharge;

  @override
  String toString() => "TimeSlot { time: $time, charge: $extraCharge}";
}