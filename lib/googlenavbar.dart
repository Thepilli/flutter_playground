import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBar_Widget extends StatelessWidget {
  void Function(int)? onTabChange;

  GoogleNavBar_Widget({super.key, required this.onTabChange});

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
