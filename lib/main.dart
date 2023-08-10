import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notifications_app/routes/second_page.dart';
import 'package:push_notifications_app/services/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() {
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payLoad) {
    navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => SecondPage(
              payLoad: payLoad,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
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
