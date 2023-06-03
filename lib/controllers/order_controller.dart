import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../models/shopping_model.dart';

class OrderController extends GetxController {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  RxBool isLoading = false.obs;

  Rx<List<ShoppingModel>> ordered = Rx<List<ShoppingModel>>([]);

  DatabaseReference reference = FirebaseDatabase.instance.ref().child("Orders");

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    DataSnapshot snapshot = await reference.child(userId).get();
    Map map = snapshot.value as Map;
    for (var element in map.values) {
      ShoppingModel shopped = ShoppingModel.fromSnap(element);
      ordered.value.add(shopped);
    }
    isLoading(true);
  }

  addToCart(ShoppingModel shopped) async {
    reference.child(userId).push().set(shopped.toJson());
  }
}
