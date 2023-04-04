import 'package:flutter/material.dart';

class LayoutBuilder_Widget extends StatelessWidget {
  const LayoutBuilder_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: Image.asset(
              'images/pika.jpg',
              fit: BoxFit.cover,
            ),
          );
        } else {
          return const Center(
            child: Text('Screen under 600px wide'),
          );
        }
      },
    );
  }
}
