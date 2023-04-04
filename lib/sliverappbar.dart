import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliverAppBar_Widget extends StatefulWidget {
  const SliverAppBar_Widget({super.key});

  @override
  State<SliverAppBar_Widget> createState() => _SliverAppBar_WidgetState();
}

class _SliverAppBar_WidgetState extends State<SliverAppBar_Widget> {
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
                'images/pika.jpg',
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
