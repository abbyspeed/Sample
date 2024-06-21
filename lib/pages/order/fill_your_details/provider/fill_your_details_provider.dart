import 'dart:developer';

import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:architech/pages/order/fill_your_details/model/parcel_model/parcel_model.dart';
import 'package:architech/pages/order/fill_your_details/widget/parcel_text_filed_widget.dart';
import "package:architech/pages/order/order_confirm/model/order_model.dart"
    as parcel;
import 'package:architech/pages/order/shedule_date/orderSchedule.dart';
import 'package:architech/utilts/snackbar/snackbar_normal.dart';
import 'package:flutter/material.dart';

class FillYourDetailsProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController trackingController = TextEditingController();
  TextEditingController centreController = TextEditingController();
  String longitude = '';
  String latitude = '';
  String selectedPickAddress = '';
  List<parcel.Parcel> parcelsMain = [];
  List<String> totalKg = [];

  void proceedButtonAddParcel() {
    parcelsMain.clear();
    totalKg = [];
    for (int i = 0; i < parcelListModel.length; i++) {
      parcel.Parcel parcelTemp = parcel.Parcel(
          parcelId: i.toString(),
          trackingNumber: parcelListModel[i].name.toString(),
          criteria: parcelListModel[i].criteriaList ?? [],
          timeCharge: "1",
          criteriaCharge:
              calculatedPriceCriteriaList(parcelListModel[i].criteriaList),
          parcelCharge: "1",
          totalParcels: parcelListModel.length.toString());
      parcelsMain.add(parcelTemp);
      totalKg.add(
          calculatedPriceCriteriaListKgGet(parcelListModel[i].criteriaList));
      print(totalKg.toString() + " totalkg");
      print(
        calculatedPriceCriteriaList(parcelListModel[i].criteriaList)
                .toString() +
            '  dslfkjsdlfkjsldf',
      );
    }

    notifyListeners();
  }

  String calculatedPriceCriteriaList(List<String>? criteriaList) {
    double mainValue = 0;
    if (criteriaList != null) {
      for (String value in criteriaList) {
        print(value.toString());
        if (value == "Medium") {
          mainValue += 1;
        }
        if (value == "Heavy") {
          mainValue += 2;
        }
        if (value == "Fragile") {
          mainValue += 0.50;
        }
      }
    }
    return mainValue.toString();
  }

  String calculatedPriceCriteriaListKgGet(List<String>? criteriaList) {
    double mainValue = 0;
    if (criteriaList != null) {
      for (String value in criteriaList) {
        print(value.toString());
        if (value == "Medium") {
          mainValue += 7;
        }
        if (value == "Small") {
          mainValue += 3;
        }
        if (value == "Heavy") {
          mainValue += 8;
        }
        if (value == "Fragile") {
          mainValue += 1;
        }
      }
    }
    return mainValue.toString();
  }

  String calculateKg(List<String> kgCalculate) {
    double mainValue = 0;
    if (kgCalculate != null) {
      for (int i = 0; i < kgCalculate.length; i++) {
        mainValue += double.parse(kgCalculate[i]);
      }
    }
    return mainValue.toString();
  }

  void addLatLong(
      {required String longitudes,
      required String latitudes,
      required String address}) {
    longitude = longitudes;
    latitude = latitudes;
    selectedPickAddress = address;
    log(longitude.toString(), name: "longitude1");
    log(latitude.toString(), name: "latitude1");
    notifyListeners();
  }

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
      showSnackBar(context, "Enter your number");
    } else if (latitude.isEmpty || longitude.isEmpty) {
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
