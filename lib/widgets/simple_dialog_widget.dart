import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleDialogWidget extends StatefulWidget {
  const SimpleDialogWidget({super.key});

  @override
  State<SimpleDialogWidget> createState() => _SimpleDialogWidgetState();
}

class _SimpleDialogWidgetState extends State<SimpleDialogWidget> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text('This is a title of a simple dialog'),
                contentPadding: const EdgeInsets.all(10.0),
                children: [
                  const Text('This is a simple dialog'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
          child: const Text('This is an Elevated Button'),
        ),
      ),
    );
  }
}

Future<void> onSelectNotification(String? payload) async {
  // Handle the notification tap event here
}
