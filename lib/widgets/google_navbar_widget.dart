import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/google_navbar/cart_page.dart';
import 'package:my_flutter_app/pages/google_navbar/shop_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    const CartPage(),
    // cart page
    const ShopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 161, 161),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        tabActiveBorder: Border.all(color: Colors.white, width: 1),
        gap: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Color.fromARGB(255, 111, 17, 17),
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
        ],
      ),
    );
  }
}
