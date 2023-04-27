import 'package:flutter/material.dart';

class SliverAppbarWidget extends StatefulWidget {
  const SliverAppbarWidget({super.key});

  @override
  State<SliverAppbarWidget> createState() => _SliverAppbarWidgetState();
}

class _SliverAppbarWidgetState extends State<SliverAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Image.asset(
                'assets/pika.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${1 + index}'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
