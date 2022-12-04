
import 'package:flutter/material.dart';
import 'package:splyshechka/widgets/sleep_period_picker/sleep_period_picker.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepPeriodPickerDemo extends StatefulWidget {
  const SleepPeriodPickerDemo({super.key});

  @override
  State<SleepPeriodPickerDemo> createState() => _SleepPeriodPickerDemoState();
}

class _SleepPeriodPickerDemoState extends State<SleepPeriodPickerDemo> {
  var begin = PickedTime(h: 0, m: 0);
  var end = PickedTime(h: 12, m: 0);

  void onSelectionChange(time1, time2, f) {
    setState(() {
      begin = time1;
      end = time2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SleepPeriodPicker(
      begin: begin,
      end: end,
      onSelectionChange: onSelectionChange,
    );
  }
}
