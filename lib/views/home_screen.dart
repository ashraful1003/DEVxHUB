import 'package:devxhub/constants.dart';
import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:devxhub/views/shopping_cart_screen.dart';
import 'package:devxhub/views/widgets/categories.dart';
import 'package:devxhub/views/widgets/product_card.dart';
import 'package:devxhub/views/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    FetchProductsController fetchProductsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const ShoppingCartScreen());
              },
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Column(
        children: [
          SearchBox(onChanged: (value) {}),
          Categories(onChanged: (newIndex) {

              categoryIndex = newIndex;
              fetchProductsController.sortProduct(categoryIndex);

          }),
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                fetchProductsController.productsModel.isNotEmpty
                    ? ListView.builder(
                        itemCount: fetchProductsController.productsModel.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            itemIndex: index,
                            product:
                                fetchProductsController.productsModel[index],
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
