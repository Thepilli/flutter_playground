import 'package:flutter/material.dart';

class AnimationPositionedWidget extends StatefulWidget {
  const AnimationPositionedWidget({super.key});

  @override
  State<AnimationPositionedWidget> createState() =>
      _AnimationPositionedWidgetState();
}

class _AnimationPositionedWidgetState extends State<AnimationPositionedWidget> {
  bool isTop = true;
  bool isLeft = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => isTop = !isTop);
            setState(() => isLeft = !isLeft);
          },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.teal,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top: isTop ? 0 : 200,
                  left: isLeft ? 0 : 200,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
