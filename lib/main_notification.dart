import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Local Notifications Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var androidDetails = const AndroidNotificationDetails(
                  'channel_id', 'channel_name',
                  importance: Importance.max, priority: Priority.high);
              var platformDetails = NotificationDetails(
                android: androidDetails,
              );
              // ignore: deprecated_member_use
              await flutterLocalNotificationsPlugin.schedule(
                  0,
                  'Scheduled Notification Title',
                  'Scheduled Notification Body',
                  DateTime.now().add(const Duration(seconds: 10)),
                  platformDetails,
                  payload: 'scheduled_notification_payload');
            },
            child: const Text('Schedule Notification'),
          ),
        ),
      ),
    );
  }
}
