import 'package:flutter/material.dart';
import 'package:my_flutter_app/EmailInputField.dart';
import 'package:my_flutter_app/googlenavbar.dart';
import 'package:my_flutter_app/homepage.dart';
import 'package:my_flutter_app/introduction.dart';
import 'package:my_flutter_app/layoutbuilde.dart';
import 'package:my_flutter_app/pages/PlanetCard_page.dart';
import 'package:my_flutter_app/semantics.dart';
import 'package:my_flutter_app/simpledialog.dart';
import 'package:my_flutter_app/sliverappbar.dart';
import 'package:my_flutter_app/switchlist.dart';
import 'package:my_flutter_app/tabbar.dart';
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
      showSemanticsDebugger: false,
      title: 'Random Selection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage_Starter(),
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

