import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:devxhub/views/auth/login_screen.dart';
import 'package:devxhub/views/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  // GetStorage getStorage = GetStorage();

  // RxDouble width = 50.0.obs, height = 50.0.obs;

  @override
  void onInit() {
    animationInit();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    delayAnimation();
    // FetchProductsController().fetchData();
  }

  delayAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.off(()=>HomeScreen());
  }

  animationInit() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)
        .obs
        .value;
    animation.addListener(() => update());
    animationController.forward();
  }


}
