import 'package:flutter/material.dart';

class VerticvalDividerWidget extends StatelessWidget {
  const VerticvalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
          ),
          const VerticalDivider(
            width: 30,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
