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

  RxBool isLoading = true.obs;

  Future<void> signUp() async {
    try {
      isLoading(false);
      if (passwordSignupController.text
              .compareTo(confirmPasswordSignupController.text) ==
          0) {
        if (usernameSignupController.text.isNotEmpty &&
            emailSignupController.text.isNotEmpty &&
            passwordSignupController.text.isNotEmpty) {
          /// register with email and password
          UserCredential credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailSignupController.text,
                  password: passwordSignupController.text);

          /// send user an email verification for authentication
          await credential.user!.sendEmailVerification();

          /// keeping user data for future work
          UserModel userModel = UserModel(
              name: usernameSignupController.text,
              email: emailSignupController.text,
              profile: '',
              userId: credential.user!.uid);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user!.uid)
              .set(userModel.toJson())
              .then((value) {
            usernameSignupController.clear();
            emailSignupController.clear();
            passwordSignupController.clear();
            confirmPasswordSignupController.clear();
            isLoading(true);
          });
        } else {
          /// if any of the text field is not completed
          Get.snackbar("Error", "All Required!");
        }
      } else {
        /// password is incorrect
        Get.snackbar("Error Password", "Password Doesn't Match!");
      }
    } on FirebaseAuthException catch (e) {
      /// error handling for any firebase related issue
      if (e.code == 'weak-password') {
        Get.snackbar("Weak Password",
            "Your given password is weak. Try a Strong password");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Already Registered!",
            'The account already exists for that email.');
      }
      else{
        Get.snackbar("Something Went Wrong", e.toString());
      }
    } catch (e) {
      Get.snackbar("Error Occurred!", e.toString());
    }
  }
}
