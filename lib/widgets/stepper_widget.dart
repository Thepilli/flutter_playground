import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          onStepContinue: () {
            setState(() {
              _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
            });
          },
          onStepCancel: () {
            setState(() {
              _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
            });
          },
          currentStep: _currentStep,
          steps: [
            Step(
                title: const Text('Step 1'),
                content: const Text('info 1',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                isActive: _currentStep == 0),
            Step(
                title: const Text('Step 2'),
                content: const Text('info 2',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                isActive: _currentStep == 0),
            Step(
                title: const Text('Step 3'),
                content: const Text('info 3',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                isActive: _currentStep == 0),
          ],
        ),
      ),
    );
  }
}
