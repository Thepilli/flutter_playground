import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimePicker Widget'),
        leading: IconButton(
          icon: const Icon(Icons.restore),
          onPressed: () {
            setState(() {
              _timeOfDay = TimeOfDay.now();
            });
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${_timeOfDay.hour}:${_timeOfDay.minute}',
              style: const TextStyle(fontSize: 60),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () async {
          final TimeOfDay? newTimeOfDay = await showTimePicker(
            context: context,
            initialTime: _timeOfDay,
          );
          if (newTimeOfDay != null) {
            setState(
              () {
                _timeOfDay = newTimeOfDay;
              },
            );
          }
        },
        color: Colors.amber,
        child: const Icon(
          Icons.timer,
          color: Colors.white,
        ),
      ),
    );
  }
}
