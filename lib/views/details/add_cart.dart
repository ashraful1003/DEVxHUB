import 'package:devxhub/constants.dart';
import 'package:devxhub/controllers/shopping_controller.dart';
import 'package:devxhub/models/shopping_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/products_model.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.product}) : super(key: key);

  ProductsModel product;

  RxInt added = 0.obs;

  /// checking to see if the current product is
  /// already in shopping cart
  alreadyAdded(shoppingController) {
    for (int index = 0;
        index < shoppingController.carted.value.length;
        index++) {
      if (shoppingController.carted.value[index].id == product.id) {
        added.value = 1;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ShoppingController shoppingController = Get.find();
    if (shoppingController.carted.value.isNotEmpty) {
      alreadyAdded(shoppingController);
    }

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              items(Icons.chat, "Chat", shoppingController),
              items(
                  Icons.add_shopping_cart,
                  added.value == 0 ? "Add to Cart" : "Added to Cart",
                  shoppingController),
            ],
          )),
    );
  }

  items(IconData icon, String data, shoppingController) {
    return InkWell(
      onTap: () {
        if (data.compareTo("Add to Cart") == 0) {
          shoppingController.addToCart(ShoppingModel(
              id: product.id,
              quantity: 1,
              price: product.price.toDouble(),
              title: product.title,
              image: product.image,
              description: product.description));

          added.value = 1;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          Text(
            data,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
