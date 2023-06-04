import 'package:devxhub/constants.dart';
import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:devxhub/controllers/notification_services.dart';
import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/controllers/shopping_controller.dart';
import 'package:devxhub/views/ordered_product/ordered_product_screen.dart';
import 'package:devxhub/views/shopping_cart/shopping_cart_screen.dart';
import 'package:devxhub/views/home/categories.dart';
import 'package:devxhub/views/home/product_card.dart';
import 'package:devxhub/views/home/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  RxInt categoryIndex = 0.obs;
  RxString filteredWord = ''.obs;

  @override
  Widget build(BuildContext context) {
    /// initialize rest of the controller.
    /// as we can't initialize them in splash screen
    FetchProductsController fetchProductsController = Get.find();
    fetchProductsController.fetchData();
    NotificationController notificationController = Get.find();
    ShoppingController shoppingController = Get.find();
    OrderController orderController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('Dashboard'),
        actions: [
          /// this will show your ordered items
          IconButton(
              onPressed: () {
                Get.to(() => const OrderedProductScreen());
              },
              icon: const Icon(Icons.card_travel)),

          /// this will show your carted items
          IconButton(
              onPressed: () {
                Get.to(() => const ShoppingCartScreen());
              },
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Obx(() => fetchProductsController.isLoading.value
          ? Column(
              children: [
                /// implementing search box with every keystrokes
                Obx(() => SearchBox(
                      index: categoryIndex.value,
                    )),
                /// show all the categories
                Obx(() => Categories(
                      categories: fetchProductsController.categories.value,
                      onChanged: (newIndex) {
                        categoryIndex.value = newIndex;
                        fetchProductsController.sortProduct(
                            categoryIndex.value, "");
                      },
                    )),
                const SizedBox(height: 10),
                /// show the products
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
                      Obx(() => ListView.builder(
                          itemCount:
                              fetchProductsController.products.value.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              itemIndex: index,
                              product:
                                  fetchProductsController.products.value[index],
                            );
                          })),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator())),
    );
  }
}
