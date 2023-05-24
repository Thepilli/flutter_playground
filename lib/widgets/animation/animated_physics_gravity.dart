import 'package:flutter/material.dart';

class AnimatedPhysics extends StatefulWidget {
  const AnimatedPhysics({super.key});

  @override
  State<AnimatedPhysics> createState() => _AnimatedPhysicsState();
}

class _AnimatedPhysicsState extends State<AnimatedPhysics>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  double objectY = 0.0;
  final double _gravity = 9.8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    final Tween<double> tween = Tween<double>(begin: 0, end: 11);

    _animation = tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _animation.addListener(
      () {
        setState(
          () {
            objectY = ((_animation.value * _gravity * _animation.value) / 2)
                .toDouble();
          },
        );
      },
    );
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
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 25,
                top: objectY,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.pink, shape: BoxShape.circle),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
