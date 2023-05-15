import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/article_1.txt');
}

class HtmlReaderWidget extends StatelessWidget {
  const HtmlReaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
            future: loadAsset(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data.toString())
                  : const Placeholder();
            },
          ),
        ),
      )),
    );
  }
}
