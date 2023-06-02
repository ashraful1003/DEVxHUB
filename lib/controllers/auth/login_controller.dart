import 'package:devxhub/controllers/fetch_products_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../views/home/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  GetStorage getStorage = GetStorage();

  var isLoading = false.obs;
  Rx<User?>? user;


  @override
  void onInit() {
    super.onInit();

    if (getStorage.read("id") == 1) {
      Get.off(() => HomeScreen());
    }
    // user = Rx<User?>(FirebaseAuth.instance.currentUser);
    // user!.bindStream(FirebaseAuth.instance.authStateChanges());
    // ever(user!, setInitialView);
    // isLoading(true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  // setInitialView(User? user) {
  //   if (user != null) {
  //     print(user);
  //     Get.off(() => HomeScreen());
  //   }
  // }

  Future<void> login() async {
    try {
      if (emailLoginController.text.isNotEmpty &&
          passwordLoginController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailLoginController.text,
            password: passwordLoginController.text).then((value) {
          Get.off(() => HomeScreen());
        });

        getStorage.write("id", 1);
      } else {
        Get.snackbar("Error", "All Fields Required!");
      }
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Error Happened!", e.toString());
    }
  }
}
