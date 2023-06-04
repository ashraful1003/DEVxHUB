import 'package:devxhub/models/shopping_model.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OrderedCard extends StatelessWidget {
  OrderedCard({Key? key, required this.product}) : super(key: key);

  ShoppingModel product;

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
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.3),
              borderRadius: BorderRadius.circular(22),
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
                      height: 90,
                      width: 100,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.fill,
                      )),
                ],
              ),
            ),
          ),
          // Product title and price
          Positioned(
            top: 20,
            left: 0,
            child: Container(
              height: 150,
              // our image take 200 width, that's why we set out total width - 200
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.button,
                        ),
                        Text(
                          'Quantity: ${product.quantity.toString()}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
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
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.button,
                )),
          ),
        ],
      ),
    );
  }
}
