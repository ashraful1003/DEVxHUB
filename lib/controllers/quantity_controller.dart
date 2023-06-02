import 'package:get/get.dart';

class QuantityController extends GetxController {
  RxInt quantity = 0.obs;

  setQuantity(int orderedQuantity) {
    quantity.value = orderedQuantity;
  }

  increase() {
    if (quantity.value != 5) {
      quantity.value += 1;
    }
  }

  decrease() {
    if (quantity.value != 0) {
      quantity.value -= 1;
    }
  }
}
