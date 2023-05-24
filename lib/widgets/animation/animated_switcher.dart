import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: _isOn
                  ? Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      key: UniqueKey(),
                      size: 100,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.green,
                      key: UniqueKey(),
                      size: 100,
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() => _isOn = !_isOn);
              },
              child: Text(_isOn ? 'Turn Off' : 'Turn On'),
            ),
          ],
        ),
      ),
    );
  }
}
