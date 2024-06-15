import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:architech/pages/order/fill_your_details/model/parcel_model/parcel_model.dart';
import 'package:architech/pages/order/fill_your_details/widget/parcel_text_filed_widget.dart';
import 'package:architech/pages/order/shedule_date/orderSchedule.dart';
import 'package:architech/utilts/snackbar/snackbar_normal.dart';
import 'package:flutter/material.dart';

class FillYourDetailsProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController trackingController = TextEditingController();
  TextEditingController centreController = TextEditingController();

  OrderModelTest order = OrderModelTest();
  String selectedValue = "Pick one";
  final itemList = ["Pick one", "OPC", "CPP", "ASN"];
  List<Widget> widgets = [];
  List<TextEditingController> trackingControllers = [];
  List<ParcelModelList> parcelListModel = [];
  initFunction() {
    selectedValue = itemList[0];
    // trackingControllers.add(trackingController);
    trackingParcelTextFiledCreator();
    notifyListeners();
  }

  void disPose() {
    widgets = [];
    trackingControllers = [];
    order.parcels = [];
    nameController.dispose();
    phoneController.dispose();
    pickupController.dispose();
    for (TextEditingController trackingList in trackingControllers) {
      trackingList.dispose();
    }
    centreController.dispose();
  }

  void getValues() {
    order.name = nameController.text;
    order.phoneNumber = phoneController.text;
    order.pickupLocation = pickupController.text;
    order.deliveryCentre = centreController.text;
    for (var i = 0; i < trackingControllers.length; i++) {
      ParcelModel pm = ParcelModel(trackingControllers[i].text);
      order.parcels.add(pm);
    }
    notifyListeners();
  }

  void trackingParcelTextFiledCreator() {
    TextEditingController controller = TextEditingController();
    trackingControllers.add(controller);
    widgets.add(
      ParcelTextField(
        // key: UniqueKey(),
        text: null,
        controller: controller,
        validatorFunction: () {},
        enableCriteria: false,
        criteria: [],
        indexSelected: widgets.length,
      ),
    );
    parcelListModel.add(ParcelModelList());
    notifyListeners();
  }

  // void addCriteriaList(String value, int index,
  //     {String? parcelName, required List<String> criteria}) {
  //   for (int i = 0; i < widgets.length; i++) {
  //     print("worked $i $index");
  //     if (i == index) {
  //       print("worked");
  //       widgets[index] = ParcelTextField(
  //         key: UniqueKey(),
  //         text: parcelName,
  //         controller: trackingControllers[index],
  //         validatorFunction: () {},
  //         enableCriteria: false,
  //         criteria: criteria,
  //         indexSelected: index,
  //       );
  //       notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }
  void addCriteriaList(String value, int index,
      {String? parcelName, required List<String> criteria}) {
    if (index >= 0 && index < widgets.length) {
      print("worked $index");
      trackingControllers[index].text = parcelName ?? '';
      print("worked $index");
      widgets[index] = ParcelTextField(
        text: parcelName,
        controller: trackingControllers[index],
        validatorFunction: () {},
        enableCriteria: false,
        criteria: criteria,
        indexSelected: index,
      );
      parcelListModel[index] =
          ParcelModelList(name: parcelName, criteriaList: criteria);
      print(parcelListModel.length.toString());
      print(widgets.length.toString());
      notifyListeners();
    }
  }

  bool isLoading = false;

  void isLoadingFunction(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void proceedFillDetailsFunction(BuildContext context) {
    isLoadingFunction(true);
    if (nameController.text.isEmpty) {
      showSnackBar(context, "Enter your name");
    } else if (phoneController.text.isEmpty) {
      showSnackBar(context, "Enter your phone");
    } else if (phoneController.text.isEmpty) {
      showSnackBar(context, "Enter your location");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderSchedule(
            order: order,
          ),
        ),
      );
    }
    isLoadingFunction(false);
  }
}
