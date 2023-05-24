import 'package:flutter/material.dart';

class ElevatedButtonWidgetShadow extends StatelessWidget {
  const ElevatedButtonWidgetShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.amber, // Text Color (Foreground color)
            backgroundColor: Colors.black, // Background color
            elevation: 20, // Elevation
            shadowColor: Colors.red, // Shadow Color
          ),
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetColorPress extends StatelessWidget {
  const ElevatedButtonWidgetColorPress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.redAccent; //<-- SEE HERE
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetColorHover extends StatelessWidget {
  const ElevatedButtonWidgetColorHover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.redAccent; //<-- SEE HERE
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetColorDisable extends StatelessWidget {
  const ElevatedButtonWidgetColorDisable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.black,
            disabledForegroundColor: Colors.amber.withOpacity(0.38),
            disabledBackgroundColor:
                Colors.amber.withOpacity(0.12), // Disable color
          ),
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetColorBorder extends StatelessWidget {
  const ElevatedButtonWidgetColorBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.black,
            side: const BorderSide(color: Colors.red, width: 5),
          ),
          child: const Text(
            'Elevated Button',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonWidgetColorTheme extends StatelessWidget {
  const ElevatedButtonWidgetColorTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Elevated Button 1',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Elevated Button 2',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Elevated Button 3',
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
