import 'package:flutter/cupertino.dart';

class OrderConfirmProvider extends ChangeNotifier {
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
    notifyListeners();
  }
}
