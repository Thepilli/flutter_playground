import 'package:flutter/material.dart';

class SwitchlistWidget extends StatefulWidget {
  const SwitchlistWidget({super.key});

  @override
  State<SwitchlistWidget> createState() => _SwitchlistWidgetState();
}

class _SwitchlistWidgetState extends State<SwitchlistWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text('Lights'),
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
