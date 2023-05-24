import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => _isVisible = !_isVisible);
          },
          child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.1,
              duration: const Duration(milliseconds: 1000),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.pink,
              )),
        ),
      ),
    );
  }
}
