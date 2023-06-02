import 'package:devxhub/constants.dart';
import 'package:devxhub/views/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: 20),
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Get.to(const ShoppingCartScreen());
          },
        ),
      ],
    ),);
  }
}
