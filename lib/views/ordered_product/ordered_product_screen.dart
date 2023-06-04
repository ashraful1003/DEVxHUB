import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/views/ordered_product/ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class OrderedProductScreen extends StatelessWidget {
  const OrderedProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    orderController.getProduct();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('My Order'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() {
            return !orderController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : orderController.ordered.value.isEmpty
                    ? const Center(
                        child: Text(
                        "You have not ordered anything",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        itemCount: orderController.ordered.value.length,
                        itemBuilder: (context, index) {
                          return OrderedCard(
                            product: orderController.ordered.value[index],
                          );
                        });
          }),
        ),
      ),
    );
  }
}
