
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_pillow/widgets/sleep_time_picker/sleep_time_picker.dart';

class TimeWheelPicker extends StatefulWidget {
  const TimeWheelPicker({Key? key}) : super(key: key);

  @override
  State<TimeWheelPicker> createState() => _TimeWheelPickerState();
}

class _TimeWheelPickerState extends State<TimeWheelPicker> {
  int hour = 22;
  int min = 55;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hour.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        Text(
          min.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        SleepTimePicker(
          initialHour: hour,
          initialMin: min,
          minutesInterval: 1,
          onTimeChanged: (h, m) {
            setState(() {
              hour = h;
              min = m;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              hour = Random().nextInt(24);
              min = Random().nextInt(60);
            });
          },
          child: const Text('Set time'),
        ),
      ],
    );
  }
}
