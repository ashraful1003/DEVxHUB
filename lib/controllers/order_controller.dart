import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/shopping_model.dart';

class OrderController extends GetxController {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  RxBool isLoading = false.obs;

  Rx<List<ShoppingModel>> ordered = Rx<List<ShoppingModel>>([]);

  DatabaseReference reference = FirebaseDatabase.instance.ref().child("Orders");

  Future<void> getProduct() async {
    isLoading(false);
    ordered.value = [];
    DataSnapshot snapshot = await reference.child(userId).get();
    if (snapshot.value == null) {
      isLoading(true);
    } else {
      Map map = snapshot.value as Map;
      for (var element in map.values) {
        ShoppingModel shopped = ShoppingModel.fromSnap(element);
        ordered.value.add(shopped);
      }
      isLoading(true);
    }
    update();
  }

  addToOrdered(List<ShoppingModel> shoppedList) async {
    for (var shopped in shoppedList) {
      await reference.child(userId).push().set(shopped.toJson());
      await FirebaseDatabase.instance.ref().child("Shopping").child(userId).remove();
    }
  }
}
