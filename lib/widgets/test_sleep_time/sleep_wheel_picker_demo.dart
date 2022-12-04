import 'package:flutter/material.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/sleep_wheel_picker/sleep_wheel_picker.dart';

class SleepWheelPickerDemo extends StatefulWidget {
  const SleepWheelPickerDemo({Key? key}) : super(key: key);

  @override
  State<SleepWheelPickerDemo> createState() => _SleepWheelPickerDemoState();
}

class _SleepWheelPickerDemoState extends State<SleepWheelPickerDemo> {
  int current = 2;

  void onChanged(int i) {
    setState(() {
      current = i;
    });
  }

  int infCurrent = 2;

  void infOnChanged(int i) {
    setState(() {
      infCurrent = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.space,
      child: Column(
        children: [
          SleepWheelPicker<SnoozeTime>(
            current: current,
            onChanged: onChanged,
            values: SnoozeTime.values,
          ),
          SleepWheelPicker<String>(
            current: infCurrent,
            onChanged: infOnChanged,
            values: const [
              "Custom infinite value 1",
              "Custom infinite value 2",
              "Custom infinite value 2"
            ],
            infinite: true,
          ),
        ],
      ),
    );
  }
}
