import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/fortune_wheel/demo_screen.dart';

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
    const title = ' Demo';
    return MaterialApp(
      showSemanticsDebugger: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const DemoScreen(),
      // home: const GaugeArrowAnimation(
      //   value: 0,
      // ),
    );
  }
}


// @override
// void initState() {
//   // TODO: imeplement initState
//   super.initState();

// }

// @override 
// void dispose() {
//   // TODO: implement dispose
//   super.dispose();
// }

