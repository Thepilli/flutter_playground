import 'package:flutter/material.dart';

class AnimatedCrossfadeWidget extends StatefulWidget {
  const AnimatedCrossfadeWidget({super.key});

  @override
  State<AnimatedCrossfadeWidget> createState() =>
      _AnimatedCrossfadeWidgetState();
}

class _AnimatedCrossfadeWidgetState extends State<AnimatedCrossfadeWidget> {
  bool _showFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => _showFirst = !_showFirst);
          },
          child: AnimatedCrossFade(
              firstChild: Image.asset('assets/pika.jpg'),
              secondChild: Image.asset('assets/bmi_gauge.png'),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1)),
        ),
      ),
    );
  }
}
