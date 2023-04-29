import 'package:flutter/material.dart';

import 'lottery_wheel.dart';

class MyLotteryScreen extends StatefulWidget {
  const MyLotteryScreen({super.key});

  @override
  _MyLotteryScreenState createState() => _MyLotteryScreenState();
}

class _MyLotteryScreenState extends State<MyLotteryScreen> {
  List<int> _selectedNumbers = [];

  void _onSelectionChanged(List<int> selectedNumbers) {
    setState(() {
      _selectedNumbers = selectedNumbers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Lottery')),
      body: Column(
        children: [
          LotteryWheel(
            onSelectionChanged: _onSelectionChanged,
          ),
          const SizedBox(height: 1),
          Text(
            'Selected numbers: ${_selectedNumbers.join(', ')}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
