import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimate extends StatefulWidget {
  const FlutterAnimate({super.key});

  @override
  State<FlutterAnimate> createState() => _FlutterAnimateState();
}

class _FlutterAnimateState extends State<FlutterAnimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animate'),
      ),
      body: Center(
        child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: const Text("Hello",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold))
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms, color: const Color(0xFF80DDFF))
                .animate() // this wraps the previous Animate in another Animate
                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                .slide()),
      ),
    );
  }
}
