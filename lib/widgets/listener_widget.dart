import 'package:flutter/material.dart';

class ListenerWidget extends StatefulWidget {
  const ListenerWidget({super.key});

  @override
  State<ListenerWidget> createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
  int numberOfTaps = 0;
  int numberOfReleases = 0;
  double x = 0.0; //location of the pointer
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (PointerEvent event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          numberOfTaps++;
        });
      },
      onPointerUp: (PointerEvent event) {
        setState(() {
          numberOfReleases++;
        });
      },
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            children: [
              Text('Number of taps: $numberOfTaps'),
              Text('Number of releases: $numberOfReleases'),
              Text('x: $x'),
              Text('y: $y'),
            ],
          )),
    );
  }
}
