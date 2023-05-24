import 'package:flutter/material.dart';

class AnimationTweenLinearRun extends StatefulWidget {
  const AnimationTweenLinearRun({super.key});

  @override
  State<AnimationTweenLinearRun> createState() =>
      _AnimationTweenLinearRunState();
}

class _AnimationTweenLinearRunState extends State<AnimationTweenLinearRun> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimationTweenLinear(),
      ),
    );
  }
}

class AnimationTweenLinear extends StatefulWidget {
  const AnimationTweenLinear({super.key});

  @override
  State<AnimationTweenLinear> createState() => _AnimationTweenLinearState();
}

class _AnimationTweenLinearState extends State<AnimationTweenLinear>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: (200 * _animation.value).toDouble(),
          height: (200 * _animation.value).toDouble(),
          color: Colors.pink,
        );
      },
    );
  }
}
