import 'package:flutter/material.dart';

class TextSpanWidget extends StatelessWidget {
  const TextSpanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
          text: 'Hello',
          children: [
            TextSpan(
              text: ' beautiful ',
              style: TextStyle(
                fontSize: 11,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
