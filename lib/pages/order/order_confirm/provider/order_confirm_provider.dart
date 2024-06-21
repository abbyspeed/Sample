import 'dart:math';

import 'package:architech/utilts/snackbar/snackbar_normal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/order_model.dart';

class OrderConfirmProvider extends ChangeNotifier {
  bool isLoading = false;
  int selectedPayment = -1;
  bool changePayementValue = false;
  void changeInitalTime() {
    changePayementValue = true;
    notifyListeners();
  }

  void selectedPaymentsFunction(
    int value,
  ) {
    print(value.toString() + selectedPayment.toString());
    if (selectedPayment == value) {
      selectedPayment = value;
      changePayementValue = true;
    } else if (changePayementValue) {
      selectedPayment = value;
      changePayementValue = false;
    }
    print(selectedPayment.toString());
    notifyListeners();
  }

  String calculatedPriceCriteriaList(List<Parcel> parcelsMain) {
    double mainValue = 0;
    if (parcelsMain != null) {
      for (int i = 0; i < parcelsMain.length; i++) {
        if (parcelsMain[i].criteriaCharge.isNotEmpty) {
          mainValue += double.parse(parcelsMain[i].criteriaCharge);
        }
        if (parcelsMain[i].timeCharge.isNotEmpty) {
          mainValue += double.parse(parcelsMain[i].timeCharge);
        }
        if (parcelsMain[i].parcelCharge.isNotEmpty) {
          mainValue += double.parse(parcelsMain[i].parcelCharge);
        }
      }
    }
    print(mainValue.toString());
    return mainValue.toString();
  }

  Future<void> addOrderToFirestore(OrderModel order,
      {required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(order.orderId)
        .set(order.toJson())
        .then((value) {
      showSnackBar(context, "Order Added Success Fully");
    }).catchError((error) {
      showSnackBar(context, error);
      print("Failed to add order: $error");
    });
    isLoading = false;
    notifyListeners();
  }
}

String generateOrderId() {
  // Generate a random 6-digit number
  int randomNumber = Random().nextInt(900000) + 100000;

  // Format the order ID with a prefix (optional) and the random number
  String orderId = 'ORD-$randomNumber'; // Example format: ORD-123456

  return orderId;
}

String generateOrderId1() {
  // Generate a random 6-digit number
  int randomNumber = Random().nextInt(900000) + 100000;

  // Format the order ID with a prefix (optional) and the random number
  String orderId = 'ORD-$randomNumber'; // Example format: ORD-123456

  return orderId;
}
