import 'package:flutter/material.dart';

class InputChipWidget extends StatefulWidget {
  const InputChipWidget({super.key});

  @override
  State<InputChipWidget> createState() => _InputChipWidgetState();
}

class _InputChipWidgetState extends State<InputChipWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InputChip(
          avatar: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person),
          ),
          label: const Text('Input Chip'),
          onSelected: (bool newBool) {
            setState(() {
              isSelected = !isSelected;
            });
          },
          selected: isSelected,
          selectedColor: Colors.amber,
        ),
      ),
    );
  }
}
