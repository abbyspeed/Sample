import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';

OrderModelTest _order = OrderModelTest();
OrderModelTest get order => _order;

class OrderProvider extends ChangeNotifier{
  void add(OrderModelTest order, List<ParcelModel> parcels){
    _order = order;
    _order.parcels = parcels;
    notifyListeners();
  }

  void update(OrderModelTest order){
    _order = order;
    notifyListeners();
  }

  void cancel(OrderModelTest order){
    _order.dispose();
    notifyListeners();
  }
}

class ParcelProvider extends ChangeNotifier{
  final List<ParcelModel> _parcels = [];
  List<ParcelModel> get parcels => _parcels;

  void add(ParcelModel parcel){
    _parcels.add(parcel);
    notifyListeners();
  }

  void remove(ParcelModel parcel){
    _parcels.remove(parcel);
    notifyListeners();
  }
}