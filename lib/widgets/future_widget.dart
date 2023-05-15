// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FutureWidget extends StatelessWidget {
  const FutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Widget'),
        leading: IconButton(
          icon: const Icon(Icons.restore),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print('1. task');

                await Future.delayed(const Duration(seconds: 3), () {
                  // using the await keyword, the code will wait for the Future to complete before continuing.
                  print('2. Weather: Sunny');
                });
                print(
                    '3. task'); // this will be printed after the Future completes, if the await keyword is not used, this will be printed first.
              },
              child: const Text('Get Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                print('1. task');

                String weather =
                    await Future.delayed(const Duration(seconds: 3), () {
                  return 'Sunny';
                });
                print('3. task($weather)');
              },
              child: const Text('Get Future Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                print('1. task');

                final weather =
                    await getWeather(); // use await keyword to prevent (Instance of 'Future<String>')
                print('3. task($weather)');
              },
              child: const Text('Get Future Data from Function'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getWeather() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'Sunny';
  }
}
