import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/controllers/quantity_controller.dart';
import 'package:devxhub/views/check_out/check_out_screen.dart';
import 'package:devxhub/views/shopping_cart/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('Your Cart'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() {
            return !orderController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: orderController.orders.value.length,
                    itemBuilder: (context, index) {
                      QuantityController quantityController = Get.find();
                      return ShoppingCard(
                        index: index,
                        quantityController: quantityController,
                        orderProduct: orderController.orders.value[index],
                      );
                    });
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CheckOutScreen());
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add_shopping_cart,
          size: 32,
        ),
      ),
    );
  }
}
