import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuantityController extends GetxController {
  GetStorage storage = GetStorage();
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    totalPrice.value = storage.read("price") ?? 0.0;
  }

  void getPrice(double price) {
    totalPrice.value += price;
    storage.write("price", totalPrice.value);
    update();
    print("${totalPrice.value}   hellollll");
  }
}
