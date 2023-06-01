import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class SignupController extends GetxController {
  TextEditingController usernameSignupController = TextEditingController();
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController passwordSignupController = TextEditingController();
  TextEditingController confirmPasswordSignupController =
      TextEditingController();

  Future<void> signUp() async {
    try {
      if (passwordSignupController.text
              .compareTo(confirmPasswordSignupController.text) == 0) {
        if (usernameSignupController.text.isNotEmpty &&
            emailSignupController.text.isNotEmpty &&
            passwordSignupController.text.isNotEmpty) {
          UserCredential credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailSignupController.text,
                  password: passwordSignupController.text);

          UserModel userModel = UserModel(
              name: usernameSignupController.text,
              email: emailSignupController.text,
              profile: '',
              userId: credential.user!.uid);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user!.uid)
              .set(userModel.toJson());
        } else {
          Get.snackbar("Error", "All Required!");
        }
      }
      else{
        Get.snackbar("Error Password", "Password Doesn't Match!");
      }
    } catch (e) {
      Get.snackbar("Error Occurred!", e.toString());
    }
  }
}
