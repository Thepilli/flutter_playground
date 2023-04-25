import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          tileColor: Colors.amber,
          title: const Text('data'),
          onTap: () {},
          leading: const Icon(Icons.ac_unit),
          trailing: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
