import 'package:flutter/material.dart';

class ArrowComponent extends StatelessWidget {
  const ArrowComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 36,
      child: CustomPaint(painter: _ArrowComponentPainter()),
    );
  }
}

class _ArrowComponentPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.amber
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..relativeLineTo(size.width / 2, size.height)
      ..relativeLineTo(size.width / 2, -size.height)
      ..close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
