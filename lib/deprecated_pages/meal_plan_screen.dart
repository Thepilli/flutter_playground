import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const grid());
}

class grid extends StatefulWidget {
  const grid({Key? key}) : super(key: key);

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 30,
            ),
            mealGrid(context)
          ],
        ),
      ),
    );
  }
}

Widget mealGrid(BuildContext context) {
  List<String> imageFileList = [
    'tile_snidane.png',
    'tile_svacina.png',
    'tile_obed.png',
    'tile_svaciana_2.png',
    'tile_vecere.png',
    'tile_vecere_2.png',
  ];

  return MasonryGridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 1,
    mainAxisSpacing: 27,
    crossAxisSpacing: 23,
    itemCount: imageFileList.length,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/icons/${imageFileList[index]}',
        ),
      );
    },
  );
}
