import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Fixed Aspect Ratio')),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            color: Colors.grey[300],
            child: AspectRatioWidget(
              aspectRatio: 0.5, // Set the desired aspect ratio
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  final double aspectRatio;
  final Widget child;

  const AspectRatioWidget({
    super.key,
    required this.aspectRatio,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = width / aspectRatio;

        return SizedBox(
          width: width,
          height: height,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: width,
              height: height,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
