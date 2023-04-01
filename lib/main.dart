import 'package:flutter/material.dart';
import 'roulette.dart';
import 'randomizer.dart';
import 'welcome.dart';
import 'mylotto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Selection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
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

