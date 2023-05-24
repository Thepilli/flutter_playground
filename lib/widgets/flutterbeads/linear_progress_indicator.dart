import 'package:flutter/material.dart';

class LinearProgressIndicatorWidgetIndeterminate extends StatelessWidget {
  const LinearProgressIndicatorWidgetIndeterminate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        LinearProgressIndicator(), //<-- SEE HERE
      ],
    ));
  }
}

class LinearProgressIndicatorWidgetDeterminate extends StatelessWidget {
  const LinearProgressIndicatorWidgetDeterminate({super.key});
//Note: To update progress dynamically, create a variable that holds the progress value,
// assign the variable to value property,
// and rebuild the widget using the setState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        LinearProgressIndicator(
          value: 0.7,
          color: Colors.greenAccent, //<-- SEE HERE
          backgroundColor: Colors.grey, //<-- SEE HERE
        ),
      ],
    ));
  }
}

class LinearProgressIndicatorWidgetDeterminateStateful extends StatefulWidget {
  const LinearProgressIndicatorWidgetDeterminateStateful({super.key});

  @override
  State<LinearProgressIndicatorWidgetDeterminateStateful> createState() =>
      _LinearProgressIndicatorWidgetDeterminateStatefulState();
}

class _LinearProgressIndicatorWidgetDeterminateStatefulState
    extends State<LinearProgressIndicatorWidgetDeterminateStateful>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Linear progress indicator with a fixed color',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressIndicatorWidgetIndeterminate extends StatelessWidget {
  const CircularProgressIndicatorWidgetIndeterminate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CircularProgressIndicator(), //<-- SEE HERE
      ],
    ));
  }
}

class CircularProgressIndicatorWidgetDeterminate extends StatelessWidget {
  const CircularProgressIndicatorWidgetDeterminate({super.key});
//Note: To update progress dynamically, create a variable that holds the progress value,
// assign the variable to value property,
// and rebuild the widget using the setState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CircularProgressIndicator(
          value: 0.7,
          color: Colors.greenAccent, //<-- SEE HERE
          backgroundColor: Colors.grey, //<-- SEE HERE
        ),
      ],
    ));
  }
}

class CircularProgressIndicatorWidgetDeterminateStateful
    extends StatefulWidget {
  const CircularProgressIndicatorWidgetDeterminateStateful({super.key});

  @override
  State<CircularProgressIndicatorWidgetDeterminateStateful> createState() =>
      _CircularProgressIndicatorWidgetDeterminateStatefulState();
}

class _CircularProgressIndicatorWidgetDeterminateStatefulState
    extends State<CircularProgressIndicatorWidgetDeterminateStateful>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Circular progress indicator',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'determinate Mode',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
