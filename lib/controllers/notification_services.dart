import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  /// for push notification purpose
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// user permission
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Get.snackbar("Authorized", "User Granted Permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Get.snackbar("Provisional", "User Granted Permission");
    } else {
      Get.snackbar("Denied", "User Denied Permission");
    }
  }

  getToken() async {
    String? token = await messaging.getToken();
    print(token);

    /// we can use this token later for specific notification to an user
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((event) {
      /// what will happen after clicking on notification
    });
  }

  @override
  void onInit() {
    super.onInit();
    requestNotificationPermission();
    getToken();
    firebaseInit();
  }
}
