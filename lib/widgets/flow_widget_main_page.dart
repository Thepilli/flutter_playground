import 'package:flutter/material.dart';

const buttonSize = 70.0;

class FlowWidgetMainPage extends StatelessWidget {
  const FlowWidgetMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Widget'),
      ),
      floatingActionButton: const LinearFlowWidget(),
    );
  }
}

class LinearFlowWidget extends StatefulWidget {
  const LinearFlowWidget({super.key});

  @override
  State<LinearFlowWidget> createState() => _LinearFlowWidgetState();
}

class _LinearFlowWidgetState extends State<LinearFlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: <IconData>[
        Icons.access_alarm,
        Icons.access_alarm,
        Icons.access_alarm,
      ].map<Widget>(buildItem).toList(),
    );
  }

  Widget buildItem(IconData icon) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        elevation: 0,
        splashColor: Colors.black,
        child: Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    for (int i = 0; i < context.childCount; i++) {
      const margin = 10;
      final childSize = context.getChildSize(i)!.width;
      final dx = i * (childSize + margin);
      final x = xStart;
      final y = yStart - dx * controller.value;

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
