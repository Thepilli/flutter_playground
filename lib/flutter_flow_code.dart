import 'package:flutter/material.dart';
import 'package:my_flutter_app/gesture.dart';
import 'package:my_flutter_app/mylotto.dart';
import 'package:my_flutter_app/randomizer.dart';
import 'package:my_flutter_app/roulette.dart';
import 'package:my_flutter_app/welcome.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var page = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test of ' + page.toString()),
        ),
        body: page,
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
