import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../models/shopping_model.dart';

class ShoppingController extends GetxController {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  RxBool isLoading = false.obs;

  Rx<List<ShoppingModel>> carted = Rx<List<ShoppingModel>>([]);

  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("Shopping");

  /// get shopping carted data from database
  Future<void> getProduct() async {
    isLoading(false);
    carted.value = [];
    DataSnapshot snapshot = await reference.child(userId).get();
    /// if cart is empty or not
    if (snapshot.value == null) {
      isLoading(true);
    } else {
      Map map = snapshot.value as Map;
      for (var element in map.values) {
        ShoppingModel shopped = ShoppingModel.fromSnap(element);
        carted.value.add(shopped);
      }
      isLoading(true);
    }
    update();
  }

  /// post carted products to database
  addToCart(ShoppingModel shopped) async {
    reference.child(userId).push().set(shopped.toJson());
  }
}
