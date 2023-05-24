import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedText,
    required this.headerText,
    this.isExpanded = false,
  });

  String expandedText;
  String headerText;
  bool isExpanded;
}

class ExpansionPanelWidget extends StatefulWidget {
  const ExpansionPanelWidget({super.key});

  @override
  State<ExpansionPanelWidget> createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  final List<Item> _data = List<Item>.generate(8, (int index) {
    return Item(
      headerText: 'Panel $index',
      expandedText: 'This is item #$index',
    );
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerText),
              );
            },
            body: ListTile(
              title: Text(item.expandedText),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
