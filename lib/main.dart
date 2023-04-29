import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/search_bar_widget.dart';

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
        primarySwatch: Colors.amber,
      ),
      home: const SearchBarWidget(),
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

