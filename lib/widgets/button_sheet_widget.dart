import 'package:flutter/material.dart';

class ButtonSheetWidget extends StatefulWidget {
  const ButtonSheetWidget({super.key});

  @override
  State<ButtonSheetWidget> createState() => _ButtonSheetWidgetState();
}

class _ButtonSheetWidgetState extends State<ButtonSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () => _displayButtonSheet(context),
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}

Future _displayButtonSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      barrierColor: Colors.pink.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.pink,
      builder: (context) => const SizedBox(
            height: 200,
            child: Center(child: Text('Hello World')),
          ));
}
