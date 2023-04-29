import 'dart:math';
import 'package:flutter/material.dart';

class SpinningWheel extends StatefulWidget {
  final List<String> items;

  const SpinningWheel({Key? key, required this.items}) : super(key: key);

  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _startAngle = 0.0;
  late double _endAngle = 0.0;
  int _selectedIndex = 0;
  bool _isSpinning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation.addListener(() {
      setState(() {});
    });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _startAngle = _endAngle % (2 * pi);
          _isSpinning = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spin() {
    if (_isSpinning) {
      return;
    }
    _isSpinning = true;
    _selectedIndex = 0;
    _startAngle = _endAngle % (2 * pi);
    _endAngle = _startAngle + (2 * pi * 5) + (pi / 2);
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _spin,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _SpinnerPainter(
                      startAngle: _startAngle,
                      endAngle: _endAngle,
                      items: widget.items,
                      colors: [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.orange,
                        Colors.purple,
                        Colors.pink,
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: _startAngle +
                        (_animation.value * (_endAngle - _startAngle)),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          widget.items[_selectedIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _spin,
          child: const Text('SPIN'),
        ),
      ],
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  final double startAngle;
  final double endAngle;
  final List<String> items;
  final List<Color> colors;

  _SpinnerPainter({
    this.startAngle = 0.0,
    required this.endAngle,
    required this.items,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double angle = 2 * pi / items.length; // access the items variable

    for (int i = 0; i < items.length; i++) {
      final startAngle = i * angle;
      final endAngle = angle;

      final Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..color = colors[i % colors.length];

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        endAngle,
        true,
        paint,
      );

      _drawText(canvas, size, items[i], startAngle, endAngle);
    }
  }

  void _drawText(Canvas canvas, Size size, String text, double startAngle,
      double endAngle) {
    const textStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final double angle = startAngle + (endAngle / 2);
    final double radians = angle - (pi / 2);
    final double x =
        centerX + (cos(radians) * radius * 0.7) - (textPainter.width / 2);
    final double y =
        centerY + (sin(radians) * radius * 0.7) - (textPainter.height / 2);

    final offset = Offset(x, y);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(_SpinnerPainter oldDelegate) {
    return oldDelegate.startAngle != startAngle ||
        oldDelegate.endAngle != endAngle;
  }
}
