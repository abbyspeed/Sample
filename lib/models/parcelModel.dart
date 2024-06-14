import 'package:flutter/material.dart';

class ParcelModel extends ChangeNotifier{
  late String trackingNo;
  late String parcelStatus;
  double parcelPrice = 1.00;

  ParcelModel(this.trackingNo){
    parcelStatus = "being processed";
  }

  // To be updated soon
  String updateStatus(){
    return parcelStatus;
  }
}