import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/bmi/GPT_gauge/gauge_arrow_component.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_flutter_app/widgets/gridview_custom_widget.dart';
import 'package:my_flutter_app/widgets/input_chip_widget.dart';

class GoogleNavbarWidgetStarter extends StatefulWidget {
  const GoogleNavbarWidgetStarter({super.key});

  @override
  State<GoogleNavbarWidgetStarter> createState() =>
      _GoogleNavbarWidgetStarter();
}

class _GoogleNavbarWidgetStarter extends State<GoogleNavbarWidgetStarter> {
// navigateBottomBar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // pages to navigate to
  final List<Widget> _pages = [
    // shop page
    const GridViewCustomWidget(),
    const InputChipWidget(),
    const GridViewCustomWidget(),
    // cart page
    const Center(
        child: GaugeArrowAnimation(
      value: 0,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 60, 77),
      bottomNavigationBar: GoogleNavbarWidget(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class GoogleNavbarWidget extends StatelessWidget {
  void Function(int)? onTabChange;

  GoogleNavbarWidget({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) => onTabChange!(value),
      tabActiveBorder: Border.all(color: Colors.white, width: 2),
      gap: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor: Colors.white,
      color: const Color.fromARGB(255, 111, 17, 17),
      tabs: const [
        // home tab
        GButton(
          icon: Icons.trolley,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.shop,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shop,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shop,
          text: 'Shop',
        ),
      ],
    );
  }
}
