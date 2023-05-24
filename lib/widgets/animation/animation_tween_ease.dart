import 'package:flutter/material.dart';

class AnimationTweenEaseIn extends StatefulWidget {
  const AnimationTweenEaseIn({super.key});

  @override
  State<AnimationTweenEaseIn> createState() => _AnimationTweenEaseInState();
}

class _AnimationTweenEaseInState extends State<AnimationTweenEaseIn>
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
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
          child: ScaleTransition(
        scale: (_animation) as Animation<double>,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amberAccent,
        ),
      )),
    );
  }
}

class AnimationTweenEaseOut extends StatefulWidget {
  const AnimationTweenEaseOut({super.key});

  @override
  State<AnimationTweenEaseOut> createState() => _AnimationTweenEaseOutState();
}

class _AnimationTweenEaseOutState extends State<AnimationTweenEaseOut>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
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
          child: RotationTransition(
        turns: (_animation) as Animation<double>,
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
