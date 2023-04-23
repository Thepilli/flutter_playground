import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message: 'This is Captain Pikachu',
        child: Image.asset('assets/pika.jpg'),
      ),
    );
  }
}
