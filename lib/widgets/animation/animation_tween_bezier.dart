import 'package:flutter/material.dart';

class AnimationTweenBezier extends StatefulWidget {
  const AnimationTweenBezier({super.key});

  @override
  State<AnimationTweenBezier> createState() => _AnimationTweenBezierState();
}

class _AnimationTweenBezierState extends State<AnimationTweenBezier>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    const begin = Offset(0.0, 1);
    const end = Offset(1.0, 0.0);
    const controlPoint = Offset(0.1, 0.5);
    _animation = Tween(begin: begin, end: end).animate(CurvedAnimation(
        parent: _controller,
        curve: Cubic(
          controlPoint.dx,
          controlPoint.dy,
          controlPoint.dx,
          controlPoint.dy,
        )));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SlideTransition(
        position: (_animation) as Animation<Offset>,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amberAccent,
          child: const Text(
            'Hello',
            style: TextStyle(fontSize: 30),
          ),
        ),
      )),
    );
  }
}
