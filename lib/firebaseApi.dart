import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMesaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMesaging.requestPermission();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    final FCMToken = await _firebaseMesaging.getToken();
    print("Token: $FCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
