import 'package:flutter/material.dart';

//To avoid Flutter Text overflow:
//Make sure your Text widget is inside the Row widget.
//Wrap your Text widget inside the Expanded widget.

class TextOverflowWidget extends StatelessWidget {
  const TextOverflowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            child: Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
              style: TextStyle(fontSize: 58),
              softWrap: false,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

//To show ellipsis on overflow:
class TextOverflowWidgetEllipsis extends StatelessWidget {
  const TextOverflowWidgetEllipsis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            child: Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
              style: TextStyle(fontSize: 58),
              softWrap: false,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // new
            ),
          ),
        ],
      ),
    );
  }
}

//To show fading on overflow:
class TextOverflowWidgetFade extends StatelessWidget {
  const TextOverflowWidgetFade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            Expanded(
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                style: TextStyle(fontSize: 58),
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.fade, // new
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//To show full text in a Row:
// using FittedBox changes the text size to fit the available space
class TextOverflowWidgetFittedBox extends StatelessWidget {
  const TextOverflowWidgetFittedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            Expanded(
              child: FittedBox(
                child: Text(
                  'It is a long established text.',
                  style: TextStyle(fontSize: 58),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ), // new
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextOverflowWidgetDemo extends StatelessWidget {
  const TextOverflowWidgetDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/pika.jpg',
                scale: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'FlutterBeads',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          backgroundColor: const Color(0xff6ae792),
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    style: TextStyle(fontSize: 58),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    style: TextStyle(fontSize: 58),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: FittedBox(
                    child: Text(
                      'It is a long established text.',
                      style: TextStyle(fontSize: 58),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
