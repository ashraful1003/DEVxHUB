import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  ValueChanged onChanged;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    FetchProductsController fetchProductsController = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: fetchProductsController.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /// this has been used to detect the selected index from the category
                /// name to sort them by the category
                selectedIndex = index;
                onChanged(index);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  right: index == fetchProductsController.categories.length - 1
                      ? 30
                      : 0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  fetchProductsController.categories[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
