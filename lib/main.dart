import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notifications_app/services/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //NotificationService().initNotification();
  await FlutterLocalNotificationsPlugin()
      .initialize(const InitializationSettings(
    android: AndroidInitializationSettings('flutter_logo'),
  ));
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () => NotificationApi.showNotification(
                  title: 'Hey', body: 'you fine?', payload: 'jesse.jk'),
              child: const Text('Show notifications')),
        ),
      ),
    );
  }
}
