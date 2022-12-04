import 'package:flutter_svg/svg.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/widgets/options_list/slider_element.dart';
import 'package:my_pillow/widgets/options_list/switch_element.dart';
import 'package:my_pillow/widgets/options_list/value_element.dart';
import 'package:my_pillow/widgets/sleep_container/sleep_container.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';
import 'package:my_pillow/domain/entities/alarm/snooze_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/pages/alarm/set_sleep_time_details/bloc/sleep_time_details_cubit.dart';
import 'package:my_pillow/pages/alarm/sleep_time_options/widgets/sleep_goal.dart';
import 'package:my_pillow/widgets/sleep_time_picker/sleep_time_picker.dart';

class AlarmOptions extends StatelessWidget {
  const AlarmOptions({
    Key? key,
    required this.wakeupTime,
    required this.sleepGoal,
    required this.alarmEnabled,
    required this.vibrationEnabled,
    required this.volume,
    required this.snoozeTime,
  }) : super(key: key);

  final SleepTime wakeupTime;
  final SleepTime sleepGoal;
  final bool alarmEnabled;
  final bool vibrationEnabled;
  final double volume;
  final SnoozeTime snoozeTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SleepTimePicker(
            initialHour: wakeupTime.h,
            initialMin: wakeupTime.m,
            onTimeChanged: (h, m) {
              context.read<SleepTimeDetailsCubit>().alarmTimeChanged(
                    SleepTime(
                      h: h,
                      m: m,
                    ),
                  );
            },
          ),
          SizedBox(height: 30.h),
          SleepGoal(goal: sleepGoal),
          SizedBox(height: 30.h),
          SleepContainer(
            child: SwitchElement(
              title: "Alarm",
              isActive: true,
              value: alarmEnabled,
              onChanged: (bool value) {
                context.read<SleepTimeDetailsCubit>().alarmSwitched(value);
              },
            ),
          ),
          if (alarmEnabled) ...[
            SizedBox(
              height: 10.h,
            ),
            SleepContainer(
              child: Column(
                children: [
                  SwitchElement(
                    title: "Vibration",
                    isActive: true,
                    value: vibrationEnabled,
                    onChanged: (bool value) {
                      context
                          .read<SleepTimeDetailsCubit>()
                          .vibrationSwitched(value);
                    },
                  ),
                  SliderElement(
                    icon: SvgPicture.asset(AppIcons.volume),
                    minValue: 0,
                    value: volume,
                    maxValue: 100,
                    isActive: true,
                    onChanged: (double value) {
                      context
                          .read<SleepTimeDetailsCubit>()
                          .volumeChanged(value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SleepContainer(
              child: ValueElement(
                title: "Snooze",
                isActive: true,
                onTap: () {
                  context.read<SleepTimeDetailsCubit>().snoozeClicked();
                },
                value: snoozeTime,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
