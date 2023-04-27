import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/bmi/GPT_gauge/gauge_arrow_component.dart';
import 'package:my_flutter_app/widgets/google_navbar_widget.dart';
import 'package:my_flutter_app/widgets/gridview_custom_widget.dart';
import 'package:my_flutter_app/widgets/sliver_appbar_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Widget'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.car_crash)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                  child: GaugeArrowAnimation(
                value: 0,
              )),
              Center(child: GridViewCustomWidget()),
              Center(child: SliverAppbarWidget()),
              Center(child: GoogleNavbarWidgetStarter()),
            ],
          ),
        ));
  }
}
