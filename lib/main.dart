import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/animation/animated_physics_bounce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';
    return MaterialApp(
        showSemanticsDebugger: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.pink, // foreground (text) color
            ),
          ),
        ),
        home: const AnimatedPhysicsBounce()
        // home: const GaugeArrowAnimation(
        //   value: 0,
        // ),
        );
  }
}
