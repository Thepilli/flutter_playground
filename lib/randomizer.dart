import 'dart:math';

import 'package:flutter/material.dart';

class RandomSelectionPage extends StatefulWidget {
  const RandomSelectionPage({super.key});

  @override
  _RandomSelectionPageState createState() => _RandomSelectionPageState();
}

class _RandomSelectionPageState extends State<RandomSelectionPage> {
  final List<String> firstList = [
    "Rohlik",
    "Houska",
    "Loupak",
    "Croissant",
    "Kaiserka"
  ];
  final List<String> secondList = ["Option 1", "Option 2", "Option 3"];
  String firstItemSelected1 = "";
  String firstItemSelected2 = "";
  String secondItemSelected = "";

  void generateSelection() {
    setState(() {
      firstItemSelected1 = firstList[Random().nextInt(firstList.length)];
      firstItemSelected2 = firstList[Random().nextInt(firstList.length)];
      secondItemSelected = secondList[Random().nextInt(secondList.length)];
    });
  }

  void exitApp() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Selection App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'First list selection:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Co takhle $firstItemSelected1',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '+',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              firstItemSelected2,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Text(
              'Second list selection:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              secondItemSelected,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: generateSelection,
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: exitApp,
        tooltip: 'Exit',
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
