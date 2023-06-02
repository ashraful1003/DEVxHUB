import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/views/shopping_cart/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('Your Cart!'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() {
            return !orderController.isLoading.value
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: orderController.orders.value.length,
                    itemBuilder: (context, index) {
                      return ShoppingCard(
                        index: index,
                        orderProduct: orderController.orders.value[index],
                      );
                    });
          }),
        ),
      ),
    );
  }
}
