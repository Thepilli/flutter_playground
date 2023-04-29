import 'dart:math';
import 'package:flutter/material.dart';

class LotteryWheel extends StatefulWidget {
  final int maxNumber;
  final int itemCount;
  final Function(List<int>) onSelectionChanged;

  const LotteryWheel({
    super.key,
    this.maxNumber = 99,
    this.itemCount = 6,
    required this.onSelectionChanged,
  });

  @override
  _LotteryWheelState createState() => _LotteryWheelState();
}

class _LotteryWheelState extends State<LotteryWheel> {
  final List<int> _selectedItems = [];

  void _onItemPressed(int item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        if (_selectedItems.length < widget.itemCount) {
          _selectedItems.add(item);
        }
      }
      widget.onSelectionChanged(_selectedItems);
    });
  }

  List<int> _getRandomNumbers() {
    List<int> numbers = [];
    while (numbers.length < widget.itemCount) {
      int num = Random().nextInt(widget.maxNumber) + 1;
      if (!numbers.contains(num)) {
        numbers.add(num);
      }
    }
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    List<int> numbers = _getRandomNumbers();
    List<Widget> items = List.generate(widget.maxNumber, (index) {
      int num = index + 1;
      bool isSelected = _selectedItems.contains(num);
      bool isRandom = numbers.contains(num);
      return Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.blue : (isRandom ? Colors.red : Colors.white),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: () => _onItemPressed(num),
          child: Center(
            child: Text(
              '$num',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
    });

    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(3),
      shrinkWrap: true,
      children: items,
    );
  }
}
