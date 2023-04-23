import 'package:flutter/material.dart';

class ListWheelScrollWidget extends StatefulWidget {
  const ListWheelScrollWidget({super.key});

  @override
  State<ListWheelScrollWidget> createState() => _ListWheelScrollWidgetState();
}

class _ListWheelScrollWidgetState extends State<ListWheelScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        itemExtent: 100,
        diameterRatio: 1.5,
        offAxisFraction: -0.5,
        squeeze: 2,
        children: List.generate(
            20,
            (index) => ListTile(
                  title: const Text('Item'),
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.menu),
                )),
      ),
    );
  }
}
