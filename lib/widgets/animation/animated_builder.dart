import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedBuilderWidgetSet(),
      ),
    );
  }
}

class AnimatedBuilderWidgetSet extends StatefulWidget {
  const AnimatedBuilderWidgetSet({super.key});

  @override
  State<AnimatedBuilderWidgetSet> createState() =>
      _AnimatedBuilderWidgetSetState();
}

class _AnimatedBuilderWidgetSetState extends State<AnimatedBuilderWidgetSet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animationController.repeat(reverse: true);

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
        );
      },
    );
  }
}
