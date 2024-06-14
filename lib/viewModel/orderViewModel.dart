import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:architech/models/order.model.dart';

class OrderViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addOrder(OrderModel orderData) async {
    await _db.collection("orders").add(orderData.toMap());
  }

  updateOrder(OrderModel orderData) async {
    await _db.collection("orders").doc(orderData.id).update(orderData.toMap());
  }

  Future<void> deleteOrder(String documentId) async {
    await _db.collection("orders").doc(documentId).delete();
  }

  Future<List<OrderModel>> retrieveOrders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("orders").get();
    return snapshot.docs
        .map((docSnapshot) => OrderModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
