// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrderModel {
//   final String? id;
//   final String deliveryCentre;
//   final String name; // Assuming name refers to the customer's name
//   final List<String> parcels;
//   final String phoneNumber;

//   final PickUpLocation pickUpLocation;
//   final Timestamp selectedDateAndTime;
//   final DocumentReference selectedPaymentMethod;
//   final String status;
//   final int totalPrice;

//   OrderModel({
//     this.id,
//     required this.deliveryCentre,
//     required this.name,
//     required this.parcels,
//     required this.phoneNumber,
//     required this.pickUpLocation,
//     required this.selectedDateAndTime,
//     required this.selectedPaymentMethod,
//     required this.status,
//     required this.totalPrice,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'deliveryCentre': deliveryCentre,
//       'name': name,
//       'parcels': parcels,
//       'phoneNumber': phoneNumber,
//       'pickUpLocation': pickUpLocation,
//       'selectedPaymentMethod': selectedPaymentMethod,
//       'selectedDateAndTime': selectedDateAndTime,
//       'status': status,
//       'totalPrice': totalPrice,
//     };
//   }

//   OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
//       : id = doc.id,
//         deliveryCentre = doc.data()!["deliveryCentre"],
//         name = doc.data()!["name"],
//         parcels = doc.data()!["parcels"],
//         phoneNumber = doc.data()!["phoneNumber"],
//         pickUpLocation = doc.data()!["pickUpLocation"],
//         selectedPaymentMethod = doc.data()!["selectedPaymentMethod"],
//         selectedDateAndTime = doc.data()!["selectedDateandTime"],
//         status = doc.data()!["status"],
//         totalPrice = doc.data()!["totalPrice"];
// }

// class PickUpLocation {
//   final String address;
//   final GeoPoint geoPoint;

//   PickUpLocation({
//     required this.address,
//     required this.geoPoint,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'address': address,
//       'geoPoint': geoPoint,
//     };
//   }

//   PickUpLocation.fromMap(Map<String, dynamic> pickUpLocationMap)
//       : address = pickUpLocationMap["address"],
//         geoPoint = pickUpLocationMap["geoPoint"];
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? id;
  final String deliveryCentre;
  final String name; // Assuming name refers to the customer's name
  final List<Parcel> parcels;
  final String phoneNumber;
  final String pickupLocation;

  final Timestamp? selectedDateAndTime; // Make this field nullable
  final DocumentReference selectedPaymentMethod;
  final String status;
  final int totalPrice;

  OrderModel({
    this.id,
    required this.deliveryCentre,
    required this.name,
    required this.parcels,
    required this.phoneNumber,
    required this.pickupLocation,
    required this.selectedDateAndTime,
    required this.selectedPaymentMethod,
    required this.status,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryCentre': deliveryCentre,
      'name': name,
      'parcels': parcels.asMap(),
      'phoneNumber': phoneNumber,
      'pickupLocation': pickupLocation,
      'selectedPaymentMethod': selectedPaymentMethod,
      'selectedDateAndTime': selectedDateAndTime,
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        deliveryCentre = doc.data()!["deliveryCentre"],
        name = doc.data()!["name"],
        parcels = List<Parcel>.from(
            doc.data()!["parcels"]), // Explicitly casting to List<String>
        phoneNumber = doc.data()!["phoneNumber"],
        pickupLocation= doc.data()!["pickupLocation"],
        selectedPaymentMethod = doc.data()!["selectedPaymentMethod"],
        selectedDateAndTime =
            doc.data()?["selectedDateAndTime"], // Use null-aware operator
        status = doc.data()!["status"],
        totalPrice = doc.data()!["totalPrice"];
}

class Parcel {
  final String trackingNo;
  final String address;
  final GeoPoint geoPoint;
  final String parcelStatus;

  Parcel({
    required this.trackingNo,
    required this.address,
    required this.geoPoint,
    required this.parcelStatus
  });

  Map<String, dynamic> toMap() {
    return {
      'trackingNo': trackingNo,
      'address': address,
      'geoPoint': geoPoint,
      'parcelStatus': parcelStatus
    };
  }

  Parcel.fromMap(Map<String, dynamic> parcel)
      : trackingNo = parcel["trackingNo"],
        address = parcel["address"],
        geoPoint = parcel["geoPoint"],
        parcelStatus = parcel["parcelStatus"];
}
