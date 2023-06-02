import 'package:devxhub/controllers/quantity_controller.dart';
import 'package:devxhub/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ShoppingCard extends StatelessWidget {
  ShoppingCard({Key? key, required this.index, required this.orderProduct})
      : super(key: key);

  int index;
  OrderModel orderProduct;

  @override
  Widget build(BuildContext context) {
    QuantityController quantityController = Get.find();
    quantityController.setQuantity(orderProduct.quantity);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Those are our background
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: index.isEven ? Colors.blue : backgroundColor,
              boxShadow: const [shadow],
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),

          /// image show
          Positioned(
            top: 0,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        orderProduct.image,
                        fit: BoxFit.fill,
                      )),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: backgroundColor.withOpacity(0.7)),
                            child: IconButton(
                                onPressed: () {
                                  quantityController.increase();
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )),
                          ),
                          Text(
                            "${quantityController.quantity}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: backgroundColor.withOpacity(0.7)),
                            child: IconButton(
                                onPressed: () {
                                  quantityController.decrease();
                                },
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          // Product title and price
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              // our image take 200 width, thats why we set out total width - 200
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      orderProduct.title,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Obx(() => Text(
                          "\$${orderProduct.price * quantityController.quantity.value}",
                          style: Theme.of(context).textTheme.button,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
