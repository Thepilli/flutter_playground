import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          setState(() => _isExpanded = !_isExpanded);
        },
        child: AnimatedContainer(
          width: _isExpanded ? 300 : 200,
          height: _isExpanded ? 300 : 200,
          color: _isExpanded ? Colors.pink : Colors.teal,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    ));
  }
}
