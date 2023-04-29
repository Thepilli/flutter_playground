import 'package:flutter/material.dart';

List<Widget> widgets = const [
  Icon(Icons.home),
  Icon(Icons.home),
  Icon(Icons.home),
];

class TabPageSelectionWidget extends StatefulWidget {
  const TabPageSelectionWidget({super.key});

  @override
  State<TabPageSelectionWidget> createState() => _TabPageSelectionWidgetState();
}

class _TabPageSelectionWidgetState extends State<TabPageSelectionWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widgets.length,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _tabController,
            children: widgets,
          ),
          Positioned(
            bottom: 40,
            child: TabPageSelector(
              controller: _tabController,
              color: Colors.black,
              selectedColor: Colors.blue,
            ),
          )
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            onPressed: () {
              (_index != widgets.length - 1) ? _index++ : _index = 0;
              _tabController.animateTo(_index);
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
