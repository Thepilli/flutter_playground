import 'dart:math' as math;
import 'package:flutter/material.dart';

class GaugeArrowAnimation extends StatefulWidget {
  final double value;

  const GaugeArrowAnimation({super.key, required this.value});

  @override
  _GaugeArrowAnimationState createState() => _GaugeArrowAnimationState();
}

class _GaugeArrowAnimationState extends State<GaugeArrowAnimation>
    with SingleTickerProviderStateMixin {
  double _value = 14;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(
            begin: -math.pi / 2,
            end: (widget.value - 14) * math.pi / 16 - math.pi / 2)
        .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSliderChanged(double value) {
    setState(() {
      _value = value;
      _animation = Tween<double>(
              begin: _animation.value,
              end: (_value - 14) * math.pi / 16 - math.pi / 2)
          .animate(_controller);
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gauge_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        alignment: Alignment.bottomCenter,
                        angle: _animation.value,
                        child: Image.asset(
                          'assets/gauge_arrow.png',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: _value,
            min: 14,
            max: 30,
            onChanged: _onSliderChanged,
          ),
        ],
      ),
    );
  }
}
