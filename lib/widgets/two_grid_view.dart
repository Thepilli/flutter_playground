import 'package:flutter/material.dart';

class TwoGridViewScreen extends StatelessWidget {
  const TwoGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two GridViews'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'First Grid',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              crossAxisCount: 1,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                9,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Image.asset(
                    'assets/pika.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Second Grid',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              crossAxisCount: 1,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                6,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Image.asset(
                    'assets/pika.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
