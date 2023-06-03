import 'package:devxhub/controllers/auth/login_controller.dart';
import 'package:devxhub/controllers/auth/signup_controller.dart';
import 'package:devxhub/controllers/notification_services.dart';
import 'package:devxhub/controllers/shopping_controller.dart';
import 'package:devxhub/controllers/quantity_controller.dart';
import 'package:devxhub/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

import 'fetch_products_controller.dart';

class InitController implements Bindings {
  var isLoading = false.obs;

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashScreenController());
    Get.put(FetchProductsController());
    Get.put(LoginController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => QuantityController());
    Get.lazyPut(() => ShoppingController());
  }
}
