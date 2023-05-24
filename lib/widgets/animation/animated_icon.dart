import 'package:flutter/material.dart';

class AnimationIconWidget extends StatefulWidget {
  const AnimationIconWidget({super.key});

  @override
  State<AnimationIconWidget> createState() => _AnimationIconWidgetState();
}

class _AnimationIconWidgetState extends State<AnimationIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animationController.repeat(reverse: true); // infinite cycle
    // _animationController.forward(); // one full cycle

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedIcon(
            icon: AnimatedIcons.add_event, progress: _animationController),
      ),
    );
  }
}
