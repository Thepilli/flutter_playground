import 'package:flutter/material.dart';

class ModalBarrierWidget extends StatefulWidget {
  const ModalBarrierWidget({super.key});

  @override
  State<ModalBarrierWidget> createState() => _ModalBarrierWidgetState();
}

class _ModalBarrierWidgetState extends State<ModalBarrierWidget> {
  bool activated = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                activated = !activated;
              });
            },
            child: const Text('Reactivate'),
          ),
        ),
        if (activated)
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: true,
              onDismiss: () {
                setState(() {
                  activated = !activated;
                });
              },
              color: const Color.fromARGB(137, 221, 15, 15),
            ),
          ),
      ],
    );
  }
}
