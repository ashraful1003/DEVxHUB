import 'package:get/get.dart';

class QuantityController extends GetxController {
  RxInt quantity = 0.obs;
  RxDouble totalPrice = (0.0).obs;

  int increase(int orderedQuantity) {
    if (orderedQuantity != 5) {
      orderedQuantity = orderedQuantity + 1;
    }
    quantity.value = orderedQuantity;
    update();

    return orderedQuantity;
  }

  int decrease(int orderedQuantity) {
    if (orderedQuantity != 5) {
      orderedQuantity = orderedQuantity - 1;
    }
    quantity.value = orderedQuantity;
    update();

    return orderedQuantity;
  }

  double getPrice(double price) {
    totalPrice.value = price * quantity.value;
    // update();

    return totalPrice.value;
  }
}
