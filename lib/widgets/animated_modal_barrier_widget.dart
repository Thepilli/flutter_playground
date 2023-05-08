import 'package:flutter/material.dart';

class AnimatedModalBarrierWidget extends StatefulWidget {
  const AnimatedModalBarrierWidget({
    super.key,
  });

  @override
  State<AnimatedModalBarrierWidget> createState() =>
      _AnimatedModalBarrierWidgetState();
}

class _AnimatedModalBarrierWidgetState extends State<AnimatedModalBarrierWidget>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late Widget _animatedModalBarrier;

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    ColorTween colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.9),
      end: Colors.white.withOpacity(0.0),
    );
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _colorAnimation = colorTween.animate(_animationController);

    _animatedModalBarrier = AnimatedModalBarrier(
      dismissible: true,
      color: _colorAnimation,
      onDismiss: () {},
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 250,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _isPressed = true;
                        },
                      );

                      _animationController.reset();
                      _animationController.forward();
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          setState(
                            () {
                              _isPressed = false;
                            },
                          );
                        },
                      );
                    },
                    child: const Text('press me'),
                  ),
                  if (_isPressed) _animatedModalBarrier,
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
