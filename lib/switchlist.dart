import 'package:flutter/material.dart';

class Switchlist_widget extends StatefulWidget {
  const Switchlist_widget({super.key});

  @override
  State<Switchlist_widget> createState() => _Switchlist_widgetState();
}

class _Switchlist_widgetState extends State<Switchlist_widget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text('SwitchListTile'),
          value: _lights,
          onChanged: (bool value) {
            setState(() {
              _lights = value;
            });
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
      ),
    );
  }
}
