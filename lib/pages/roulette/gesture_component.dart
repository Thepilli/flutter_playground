import 'package:flutter/material.dart';

class GestureDetectorComponent extends StatelessWidget {
  const GestureDetectorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // When the child is tapped, show a snackbar.
          onTap: () {
            const snackBar = SnackBar(
              content: Text(
                'This feels good',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.lime,
              duration: Duration(milliseconds: 10),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          // The custom button
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Text('Tap me!'),
          ),
        ),
      ),
    );
  }
}
