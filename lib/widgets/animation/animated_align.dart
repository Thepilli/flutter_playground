import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool isAligned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => isAligned = !isAligned);
          },
          child: Container(
              height: 300,
              width: 300,
              color: Colors.teal,
              child: AnimatedAlign(
                alignment: isAligned ? Alignment.center : Alignment.topRight,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const Icon(
                  Icons.ac_unit,
                  size: 100,
                  color: Colors.pink,
                ),
              )),
        ),
      ),
    );
  }
}
