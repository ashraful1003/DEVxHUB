import 'package:devxhub/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login Screen",
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
                controller: loginController.emailLoginController,
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
                controller: loginController.passwordLoginController,
                fieldIcon: Icons.lock,
                fieldLabelText: "Password",
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "New User?",
                ),
                Container(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Register Here",
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
