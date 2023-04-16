import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

Future<String> getFuture() async {
  await Future.delayed(const Duration(seconds: 1));
  // throw Exception('Error');
  return 'It works';
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getFuture(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data.toString()),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
