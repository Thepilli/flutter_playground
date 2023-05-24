import 'package:flutter/material.dart';

import 'html_reader_custom_widget.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({super.key});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  static const loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Widget'),
      ),
      body: ListView(
        children: [
          buildCard('Expandable', 'assets/pika.jpg', 'assets/example.html'),
          buildCard('Expandable', 'assets/pika.jpg', 'assets/example.html'),
          buildCard('Expandable', 'assets/pika.jpg', 'assets/example.html'),
        ],
      ),
    );
  }

  Widget buildCard(String title, String image, String htmlFilePath) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ExpansionTile(
          // title: Text(title),
          title: Image.asset(
            image,
            height: 100,
          ),
          children: [
            HtmlReaderCustomWidget(htmlFilePath: htmlFilePath),
            const Text(
              loremIpsum,
              style: TextStyle(fontSize: 5),
            )
          ],
        ),
      ));
}
