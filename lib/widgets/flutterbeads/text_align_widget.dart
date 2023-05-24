import 'package:flutter/material.dart';

class TextAlignWidget extends StatelessWidget {
  const TextAlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            //currently sets the
            height: 50,
          ),
          Text(
            //currently sets the width of the column
            'Lorem Ipsum',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

//To center a Text using the SizedBox widget:
class TextAlignWidgetSizeBox extends StatelessWidget {
  const TextAlignWidgetSizeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text(
            // currently centered because the crossAxisAlignment defaults to center of the column
            'Lorem Ipsum',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

//To align text in flutter using the center widget:
class TextAlignWidgetCenter extends StatelessWidget {
  const TextAlignWidgetCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Lorem Ipsum',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

//To center Text in Flutter using Align widget:
class TextAlignWidgetAlign extends StatelessWidget {
  const TextAlignWidgetAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Lorem Ipsum',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
