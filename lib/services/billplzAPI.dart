import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:architech/models/orderModel.dart';
import 'package:architech/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillplzServiceAPI {
  String _billingId = '';
  String _billingUrl = '';
  // ignore: unused_field
  String _collectionId = '';
  String _resultHandlingError = 'Request has successfully been delivered! With exception of poor result handling';

  /// Creating a new group based on [GroupModel] instance
  /// $: success -> return an ID of the newly created order
  /// $: failed -> return a null
  Future<String?> createBilling(OrderModelTest order, User user) async {
    String? _returnValue;
    final url = ("https://v192b9gp2l.execute-api.ap-southeast-1.amazonaws.com/Prod/transaction/billplz/create");
    double totalamount = 0;

    List<Map<String, dynamic>> itemsInListMap = [];
    for (var i = 0; i < order.parcels.length; i++) {
      double total = order.parcels[i].parcelPrice;
      totalamount += total;
      // Map<String, dynamic> item = order.parcels[i].toJson();
      // itemsInListMap.add(item);
    }

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': order.orderId,
        'email': user.email ?? "none",
        'mobile': order.phoneNumber ?? "none",
        'name': user.username,
        'amount': totalamount,
      }),
    );
    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        _billingId = data?["bill_id"];
        _billingUrl = data?["bill_url"];
        _collectionId = data?["coll_id"];
        _returnValue = _billingUrl;
      } catch (e) {
        _returnValue = _resultHandlingError;
        // ignore: avoid_print
        print('createBilling() ERROR: ${e.toString()}');
      }
    } else {
      _billingUrl = 'unable to perform request!';
      _returnValue = null;
    }

    print('createBilling(): [${response.statusCode}] $_billingUrl');
    print('billing Id: $_billingId');

    return _returnValue;
  }
}

class BillplzResponseData {
  String? billingId;
  String? billingUrl;
  String? collectionId;
  BillplzResponseData({
    required this.billingId,
    required this.billingUrl,
    required this.collectionId,
  });
}
