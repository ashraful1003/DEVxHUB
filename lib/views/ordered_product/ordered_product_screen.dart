import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/views/ordered_product/ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../details/add_cart.dart';

class OrderedProductScreen extends StatelessWidget {
  const OrderedProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
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
