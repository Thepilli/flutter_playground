import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AnimatedPhysicsBounce extends StatefulWidget {
  const AnimatedPhysicsBounce({super.key});

  @override
  State<AnimatedPhysicsBounce> createState() => _AnimatedPhysicsBounceState();
}

class _AnimatedPhysicsBounceState extends State<AnimatedPhysicsBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: 0, upperBound: double.infinity);
    _simulation = SpringSimulation(
      const SpringDescription(
        mass: 0.5,
        stiffness: 100,
        damping: 10,
      ),
      0,
      300,
      0,
    );
    _controller.animateWith(_simulation);
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
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(150, _controller.value),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.pink, shape: BoxShape.circle),
            ),
          );
        },
      ),
    );
  }
}
