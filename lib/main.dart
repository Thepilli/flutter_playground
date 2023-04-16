import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/planet_demo/planet_demo_card.dart';

import 'package:my_flutter_app/widgets/webview_widget.dart';
import 'package:my_flutter_app/widgets/textform_widget.dart';
import 'package:my_flutter_app/widgets/html_reader_widget.dart';

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
        home: planet_demo_home());
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

