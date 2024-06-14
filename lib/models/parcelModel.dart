import 'package:flutter/material.dart';

class ParcelModel extends ChangeNotifier{
  late String trackingNo;
  late String parcelStatus;
  double parcelPrice = 1.00;
  List<String>? criterias;
  double criteriaPrice = 0;

  ParcelModel(this.trackingNo){
    parcelStatus = "being processed";
  }

  // To be updated soon
  String updateStatus(){
    return parcelStatus;
  }

  double totalCriteriaPrice(){
    for(int i=0; i<criterias!.length; i++){
      if(criterias![i] == "Small"){
        criteriaPrice += 0;

      } else if(criterias![i] == "Medium"){
        criteriaPrice += 1;

      } else if(criterias![i] == "Heavy"){
        criteriaPrice += 2;

      } else if(criterias![i] == "Fragile"){
        criteriaPrice += 0.5;
      }
    }

    return criteriaPrice;
  }
}