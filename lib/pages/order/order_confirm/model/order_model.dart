// class OrderModel {
//   final String orderId;
//   final String userId;
//   final String name;
//   final String phoneNumber;
//   final PickLocation pickLocation;
//   final PickLocation deliveryLocation;
//   final String selectedDate;
//   final String selectedTime;
//   final String paymentMethod;
//   final String status;
//   final List<Parcel> parcels; // Changed from 'parcel' to 'parcels'
//   final String deliveryCharge;
//   final String totalPrice;
//
//   OrderModel({
//     required this.orderId,
//     required this.userId,
//     required this.name,
//     required this.phoneNumber,
//     required this.pickLocation,
//     required this.deliveryLocation,
//     required this.selectedDate,
//     required this.selectedTime,
//     required this.paymentMethod,
//     required this.status,
//     required this.parcels,
//     required this.deliveryCharge,
//     required this.totalPrice,
//   });
//
//   // Convert object to JSON format for Firestore
//   Map<String, dynamic> toJson() => {
//         "orderId": orderId,
//         "userId": userId,
//         "name": name,
//         "phoneNumber": phoneNumber,
//         "pickLocation": pickLocation.toJson(),
//         "deliveryLocation": deliveryLocation.toJson(),
//         "selectedDate": selectedDate,
//         "selectedTime": selectedTime,
//         "paymentMethod": paymentMethod,
//         "status": status,
//         "parcels": parcels.map((parcel) => parcel.toJson()).toList(),
//         "deliveryCharge": deliveryCharge,
//         "totalPrice": totalPrice,
//       };
// }
//
// class Parcel {
//   final String parcelId;
//   final String trackingNumber;
//   final List<String> criteria;
//   final String timeCharge;
//   final String criteriaCharge;
//   final String parcelCharge;
//   final String totalParcels;
//
//   Parcel({
//     required this.parcelId,
//     required this.trackingNumber,
//     required this.criteria,
//     required this.timeCharge,
//     required this.criteriaCharge,
//     required this.parcelCharge,
//     required this.totalParcels,
//   });
//
//   Map<String, dynamic> toJson() => {
//         "parcelId": parcelId,
//         "trackingNumber": trackingNumber,
//         "criteria": criteria,
//         "timeCharge": timeCharge,
//         "criteriaCharge": criteriaCharge,
//         "parcelCharge": parcelCharge,
//         "totalParcels": totalParcels,
//       };
// }
//
// class PickLocation {
//   final String address;
//   final String latitude;
//   final String longitude;
//
//   PickLocation({
//     required this.address,
//     required this.latitude,
//     required this.longitude,
//   });
//
//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final String name;
  final String phoneNumber;
  final PickLocation pickLocation;
  final PickLocation deliveryLocation;
  final String selectedDate;
  final String selectedTime;
  final String paymentMethod;
  final String status;
  final List<Parcel> parcels;
  final String deliveryCharge;
  final String totalPrice;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.pickLocation,
    required this.deliveryLocation,
    required this.selectedDate,
    required this.selectedTime,
    required this.paymentMethod,
    required this.status,
    required this.parcels,
    required this.deliveryCharge,
    required this.totalPrice,
  });

  factory OrderModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    var data = doc.data()!;
    return OrderModel(
      orderId: data['orderId'],
      userId: data['userId'],
      name: data['name'],
      phoneNumber: data['phoneNumber'],
      pickLocation: PickLocation.fromJson(data['pickLocation']),
      deliveryLocation: PickLocation.fromJson(data['deliveryLocation']),
      selectedDate: data['selectedDate'],
      selectedTime: data['selectedTime'],
      paymentMethod: data['paymentMethod'],
      status: data['status'],
      parcels: (data['parcels'] as List)
          .map((parcel) => Parcel.fromJson(parcel))
          .toList(),
      deliveryCharge: data['deliveryCharge'],
      totalPrice: data['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "userId": userId,
        "name": name,
        "phoneNumber": phoneNumber,
        "pickLocation": pickLocation.toJson(),
        "deliveryLocation": deliveryLocation.toJson(),
        "selectedDate": selectedDate,
        "selectedTime": selectedTime,
        "paymentMethod": paymentMethod,
        "status": status,
        "parcels": parcels.map((parcel) => parcel.toJson()).toList(),
        "deliveryCharge": deliveryCharge,
        "totalPrice": totalPrice,
      };
}

class Parcel {
  final String parcelId;
  final String trackingNumber;
  final List<String> criteria;
  final String timeCharge;
  final String criteriaCharge;
  final String parcelCharge;
  final String totalParcels;

  Parcel({
    required this.parcelId,
    required this.trackingNumber,
    required this.criteria,
    required this.timeCharge,
    required this.criteriaCharge,
    required this.parcelCharge,
    required this.totalParcels,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      parcelId: json['parcelId'],
      trackingNumber: json['trackingNumber'],
      criteria: List<String>.from(json['criteria']),
      timeCharge: json['timeCharge'],
      criteriaCharge: json['criteriaCharge'],
      parcelCharge: json['parcelCharge'],
      totalParcels: json['totalParcels'],
    );
  }

  Map<String, dynamic> toJson() => {
        "parcelId": parcelId,
        "trackingNumber": trackingNumber,
        "criteria": criteria,
        "timeCharge": timeCharge,
        "criteriaCharge": criteriaCharge,
        "parcelCharge": parcelCharge,
        "totalParcels": totalParcels,
      };
}

class PickLocation {
  final String address;
  final String latitude;
  final String longitude;

  PickLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory PickLocation.fromJson(Map<String, dynamic> json) {
    return PickLocation(
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };
}
