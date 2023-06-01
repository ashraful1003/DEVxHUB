import 'package:devxhub/controllers/auth/login_controller.dart';
import 'package:devxhub/controllers/auth/signup_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class InitController implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignupController());
    Get.put(LoginController());
    initFirebase();
  }

  initFirebase() async {
    await Firebase.initializeApp();
  }
}
