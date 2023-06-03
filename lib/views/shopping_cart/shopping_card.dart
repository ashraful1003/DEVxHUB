import 'package:devxhub/controllers/quantity_controller.dart';
import 'package:devxhub/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ShoppingCard extends StatelessWidget {
  ShoppingCard(
      {Key? key,
      required this.index,
      required this.orderProduct,
      required this.quantityController})
      : super(key: key);

  int index;
  OrderModel orderProduct;
  QuantityController quantityController;

  @override
  Widget build(BuildContext context) {
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
                                  orderProduct.quantity = quantityController.increase(
                                      quantityController.quantity.value);
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )),
                          ),
                          Text(
                            "${quantityController.quantity}",
                            style: const TextStyle(
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
                                  orderProduct.quantity = quantityController.decrease(
                                      quantityController.quantity.value);
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
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
            child: Container(
              height: 150,
              // our image take 200 width, thats why we set out total width - 200
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      orderProduct.title,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  Spacer(),
                  GetBuilder<QuantityController>(
                      init: QuantityController(),
                      builder: (controller) {
                        return Container(
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
                            child: Text(
                              "\$${controller.getPrice(orderProduct.price)}",
                              style: Theme.of(context).textTheme.button,
                            ));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
