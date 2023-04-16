import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Widget'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.car_crash)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text('Car')),
              Center(child: Text('Transit')),
              Center(child: Text('Bike')),
            ],
          ),
        ));
  }
}
