import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/roulette/gesture_component.dart';
import 'package:roulette/roulette.dart';
import 'arrow_component.dart';
import 'dart:math';

class RouletterComponent extends StatelessWidget {
  const RouletterComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Roulette(
              // Provide controller to update its state
              controller: controller,
              // Configure roulette's appearance
              style: const RouletteStyle(
                dividerThickness: 4,
                textLayoutBias: .8,
                centerStickerColor: Color(0xFF45A3FA),
              ),
            ),
          ),
        ),
        const ArrowComponenet(),
      ],
    );
  }
}

class RouletteHomePage extends StatefulWidget {
  const RouletteHomePage({Key? key}) : super(key: key);

  @override
  State<RouletteHomePage> createState() => _RouletteHomePageState();
}

class _RouletteHomePageState extends State<RouletteHomePage>
    with SingleTickerProviderStateMixin {
  static final _random = Random();

  late RouletteController _controller;
  bool _clockwise = false;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  final names = <String>[
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Amber',
    'Indigo',
  ];
  final pecivo = <String>[
    'images/pika.jpg',
    'images/pika.jpg',
    'images/pika.jpg',
    'images/pika.jpg',
    'images/pika.jpg',
    'images/pika.jpg',
  ];

  @override
  void initState() {
    // Initialize the controller
    final group = RouletteGroup.uniform(
      colors.length,
      textBuilder: pecivo.elementAt,
      colorBuilder: colors.elementAt,
    );
    _controller = RouletteController(vsync: this, group: group);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roulette'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.1),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Clockwise: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: _clockwise,
                    onChanged: (onChanged) {
                      setState(() {
                        _controller.resetAnimation();
                        _clockwise = !_clockwise;
                      });
                    },
                  ),
                ],
              ),
              RouletterComponent(controller: _controller),
              const SizedBox(
                width: 500,
                height: 100,
              ),
              const GestureDetectorComponent()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Use the controller to run the animation with rollTo method
        onPressed: () => _controller.rollTo(
          0,
          clockwise: _clockwise,
          offset: _random.nextDouble(),
        ),
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
