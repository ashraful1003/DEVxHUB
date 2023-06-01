import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  Future<void> login() async {
    try {
      if (emailLoginController.text.isNotEmpty &&
          passwordLoginController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailLoginController.text,
            password: passwordLoginController.text);
      } else {
        Get.snackbar("Error", "All Fields Required!");
      }
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Error Happened!", e.toString());
    }
  }
}
