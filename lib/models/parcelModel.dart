import 'package:flutter/material.dart';

class ParcelModel extends ChangeNotifier{
  late String trackingNo;
  late String parcelStatus;

  ParcelModel(this.trackingNo){
    this.parcelStatus = "being processed";
  }

  // To be updated soon
  String updateStatus(){
    return parcelStatus;
  }
}