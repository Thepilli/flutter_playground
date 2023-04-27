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
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(
            begin: -math.pi / 2,
            end: (widget.value) * math.pi / 16 - math.pi / 2)
        .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _onSliderChanged(double value) {
  //   setState(() {
  //     _value = value;
  //     _animation = Tween<double>(
  //             begin: _animation.value,
  //             end: (_value - 14) * math.pi / 16 - math.pi / 2)
  //         .animate(_controller);
  //     _controller.reset();
  //     _controller.forward();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 400,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bmi_gauge.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 140, left: 10),
                child: SizedBox(
                  height: 100,
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
          // Slider(
          //   value: _value,
          //   min: 14,
          //   max: 40,
          //   onChanged: _onSliderChanged,
          // ),
        ],
      ),
    );
  }
}
