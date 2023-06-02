import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class OrderModel {
  int id, quantity;
  double price;
  String title, description, image;

  OrderModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.title,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "quantity": quantity,
      "price": price,
      "title": title,
      "description": description,
      "image": image,
    };
  }

  static OrderModel fromSnap(dynamic snap) {
  //   // List<OrderModel> orders = [];
  //   // var snapshot = snap.data() as Map<String, dynamic>;
  //   // snapshot.forEach((key, value) {
  //   //   OrderModel order = OrderModel(
  //   //       id: value["id"],
  //   //       quantity: value["quantity"],
  //   //       price: value["price"],
  //   //       image: value["image"],
  //   //       description: value["description"],
  //   //       title: value["title"]);
  //   //
  //   //   orders.add(order);
  //   // });
    return OrderModel(
        id: snap["id"],
        quantity: snap["quantity"],
        price: snap["price"],
        image: snap["image"],
        description: snap["description"],
        title: snap["title"]);
  }
}
