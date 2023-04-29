import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: const Text(
              'show/hide',
            ),
          ),
          Image.asset(
            'assets/pika.jpg',
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: _visible,
            child: Image.asset(
              'assets/pika.jpg',
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
