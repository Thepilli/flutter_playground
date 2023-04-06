import 'package:flutter/material.dart';
import 'package:my_flutter_app/googlenavbar.dart';
import 'package:my_flutter_app/pages/cart_page.dart';
import 'package:my_flutter_app/pages/shop_page.dart';

class HomePage_Starter extends StatefulWidget {
  const HomePage_Starter({super.key});

  @override
  State<HomePage_Starter> createState() => _HomePage_StarterState();
}

class _HomePage_StarterState extends State<HomePage_Starter> {
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
      bottomNavigationBar: GoogleNavBar_Widget(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
