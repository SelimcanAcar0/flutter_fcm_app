import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String? notificationBody;
  String? notificationTitle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((event) {
      notificationBody = event.notification!.body;
      notificationTitle = event.notification!.body;
      // do something
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      // do something
      notificationBody = event.notification!.body;
      notificationTitle = event.notification!.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase Notification'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              notificationTitle ?? "Boş",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              notificationBody ?? "Boş",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
