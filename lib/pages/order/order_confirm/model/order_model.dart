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
  final List<Parcel> parcels; // Changed from 'parcel' to 'parcels'
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

  // Convert object to JSON format for Firestore
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

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      };
}
