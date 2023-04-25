import 'package:flutter/material.dart';

class TweenAnimationWidget extends StatefulWidget {
  const TweenAnimationWidget({super.key});

  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> {
  double targetValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween(begin: 0, end: targetValue),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return IconButton(
              iconSize: value,
              color: Colors.blue,
              icon: const Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  targetValue = targetValue == 100 ? 250 : 100;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
