import 'package:architech/models/order.model.dart';
import 'package:architech/pages/order/order_confirm/model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addOrder(OrderModels orderData) async {
    await _db.collection("orders").add(orderData.toMap());
  }

  updateOrder(OrderModels orderData) async {
    await _db.collection("orders").doc(orderData.id).update(orderData.toMap());
  }

  Future<void> deleteOrder(String documentId) async {
    await _db.collection("orders").doc(documentId).delete();
  }

  // Future<List<OrderModels>> retrieveOrders() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("orders").get();
  //
  //   log(snapshot.docs.toString());
  //   return snapshot.docs
  //       .map((docSnapshot) => OrderModels.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }
  Future<List<OrderModel>> retrieveOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("orders").get();

    return snapshot.docs
        .map((docSnapshot) => OrderModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
