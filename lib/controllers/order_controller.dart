import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];

  addToCart(OrderModel order) {
    orders.add(order);
    print(orders.length);
  }
}
