import 'package:flutter/material.dart';

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidget(),
    );
  }
}

myWidget() => Builder(builder: (context) {
      // wrap the widget with Builder to get the context
      return Text(
        'Builder Widget',
        style: Theme.of(context).textTheme.displayLarge,
      );
    });
