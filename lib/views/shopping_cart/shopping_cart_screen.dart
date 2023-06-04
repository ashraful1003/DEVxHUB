import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/controllers/shopping_controller.dart';
import 'package:devxhub/views/shopping_cart/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingController shoppingController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('My Cart'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() {
            return !shoppingController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : shoppingController.carted.value.isEmpty
                    ? const Center(
                        child: Text(
                        "Your Cart is Empty",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        itemCount: shoppingController.carted.value.length,
                        itemBuilder: (context, index) {
                          return ShoppingCard(
                            index: index,
                            shoppingModel:
                                shoppingController.carted.value[index],
                          );
                        });
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          OrderController().addToOrdered(shoppingController.carted.value);
          Get.to(
            UsePaypal(
                sandboxMode: true,
                clientId:
                    "Afyb4P_4cvbDasMarJzCptL0dCklq1uiLGvzYDpCuwSaVt0v503E2RUg7rvkQv9zb9uiZHBnlf_7aYep",
                secretKey:
                    "EBxfntG-VNnIEVM5E2Y0r5XIodG_5ldPaY0zlInEsjiR-GfI7rEJGQyxz3ZMk5a7DLE1DCRlmDh9HyU7",
                returnURL: "https://samplesite.com/return",
                cancelURL: "https://samplesite.com/cancel",
                transactions: [
                  {
                    "amount": {
                      "total": '${GetStorage().read('price')}',
                      "currency": "USD",
                      "details": {
                        "subtotal": '${GetStorage().read('price')}',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": const {
                      /// here we can add carted items making model class with the given
                      /// format.
                      "items": [
                        {
                          "name": "A demo product",
                          "quantity": 1,
                          "price": '10.12',
                          "currency": "USD"
                        }
                      ],

                      /// shipping address is not required though
                      ///
                      "shipping_address": {
                        "recipient_name": "Jane Foster",
                        "line1": "Travis County",
                        "line2": "",
                        "city": "Austin",
                        "country_code": "US",
                        "postal_code": "73301",
                        "phone": "+00000000",
                        "state": "Texas"
                      },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                },
                onCancel: (params) {
                  print('cancelled: $params');
                }),
          );
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
