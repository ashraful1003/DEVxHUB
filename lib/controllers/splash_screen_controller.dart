import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:devxhub/controllers/order_controller.dart';
import 'package:devxhub/views/auth/login_screen.dart';
import 'package:devxhub/views/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  /// for push notification purpose
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print(token);
    /// we can use this token later for specific notification to an user
  }

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((event) {
      /// what will happen after clicking on notification
    });
  }

  @override
  void onInit() {
    animationInit();
    super.onInit();
    getToken();
  }

  @override
  void onReady() {
    super.onReady();
    delayAnimation();
  }

  delayAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (FirebaseAuth.instance.currentUser!=null) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(() => LoginScreen());
    }
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
