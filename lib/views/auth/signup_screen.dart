import 'package:devxhub/controllers/auth/signup_controller.dart';
import 'package:devxhub/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to VIDTOK",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                controller: signupController.emailSignupController,
                fieldIcon: Icons.email,
                fieldLabelText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                controller: signupController.passwordSignupController,
                fieldIcon: Icons.lock,
                fieldLabelText: "Set Password",
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                controller: signupController.confirmPasswordSignupController,
                fieldIcon: Icons.lock,
                fieldLabelText: "Confirm Password",
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                controller: signupController.usernameSignupController,
                fieldIcon: Icons.person,
                fieldLabelText: "Username",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                    onPressed: () {
                      signupController.signUp();
                      Get.off(()=>const LoginScreen());
                    },
                    child: const Text("Register"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Already Registered?",
                ),
                Container(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: GestureDetector(
                        onTap: () {
                          Get.off(()=>LoginScreen());
                        },
                        child: Text(
                          "Login Here",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade900),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
