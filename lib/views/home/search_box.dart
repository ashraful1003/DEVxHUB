import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)),
      child: GetBuilder<FetchProductsController>(
        init: FetchProductsController(),
        builder: (controller) {
          return TextField(
            onChanged: (value) {
              controller.sortProduct(index, value);
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                icon: const Icon(Icons.search),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6))),
          );
        },
      ),
    );
  }
}
