import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({super.key});

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  List<String> titles = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          setState(() {
            Form.of(primaryFocus!.context!).save();
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(titles.length, (int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onSaved: (String? value) {
                      titles[index] = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(titles[index]),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      )),
    );
  }
}
