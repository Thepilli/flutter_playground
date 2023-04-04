import 'package:flutter/material.dart';

class Semantics_widget extends StatelessWidget {
  const Semantics_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          child: FlutterLogo(
            size: 200,
          ),
          label: 'Tap to increment',
        ),
        FlutterLogo(
          size: 200,
        ),
      ],
    ));
  }
}
