import 'package:flutter/material.dart';

// Requires the "showSemanticsDebugger: true," in the MaterialApp widget in main.dart

class SemanticsWidget extends StatelessWidget {
  const SemanticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      )),
    );
  }
}
