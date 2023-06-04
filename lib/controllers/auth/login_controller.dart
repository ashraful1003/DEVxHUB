import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../views/home/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  Future<void> login() async {
    /// try login using email and password
    try {
      if (emailLoginController.text.isNotEmpty &&
          passwordLoginController.text.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailLoginController.text,
                password: passwordLoginController.text)
            .then((value) {
          bool isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

          /// if user is email verified
          if (isVerified) {
            emailLoginController.clear();
            passwordLoginController.clear();
            Get.off(() => HomeScreen());
          } else {
            Get.snackbar(
                "Not Verified", "Please verify your email before proceed!");
          }
        });
      } else {
        Get.snackbar("Error", "All Fields Required!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("User Not Found!", 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            "Wrong Password", 'Wrong password provided for that user.');
      } else {
        Get.snackbar("Something Went Wrong", e.toString());
      }
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Error Happened!", e.toString());
    }
  }
}
