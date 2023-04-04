import 'package:flutter/material.dart';

class SimpleDialog_Widget extends StatefulWidget {
  const SimpleDialog_Widget({super.key});

  @override
  State<SimpleDialog_Widget> createState() => _SimpleDialog_WidgetState();
}

class _SimpleDialog_WidgetState extends State<SimpleDialog_Widget> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
