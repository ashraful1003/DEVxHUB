import 'package:devxhub/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        /// used GetBuilder to manage state change
        init: SplashScreenController(), /// initialize the controller
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      image: const DecorationImage(
                          image: AssetImage('assets/company_logo.jpg')),
                    )),
                const SizedBox(
                  height: 40,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
