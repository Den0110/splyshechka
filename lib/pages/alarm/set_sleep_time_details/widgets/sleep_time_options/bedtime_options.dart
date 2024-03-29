import 'package:splyshechka/pages/alarm/set_sleep_time_details/bloc/set_sleep_time_details_bloc.dart';
import 'package:splyshechka/widgets/options_list/switch_element.dart';
import 'package:splyshechka/widgets/sleep_container/sleep_container.dart';
import 'package:splyshechka/widgets/sleep_time_picker/sleep_time_picker.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/widgets/sleep_time_options/sleep_goal.dart';

class BedtimeOptions extends StatelessWidget {
  const BedtimeOptions({
    Key? key,
    required this.bedtime,
    required this.sleepGoal,
    required this.remindToSleep,
  }) : super(key: key);

  final SleepTime bedtime;
  final SleepTime sleepGoal;
  final bool remindToSleep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SleepTimePicker(
            initialHour: bedtime.h,
            initialMin: bedtime.m,
            onTimeChanged: (h, m) {
              context.read<SetSleepTimeDetailsBloc>().bedTimeChanged(
                    SleepTime(
                      h: h,
                      m: m,
                    ),
                  );
            },
          ),
          SizedBox(height: 30.h),
          SleepGoal(goal: sleepGoal),
          // SizedBox(height: 30.h),
          // SleepContainer(
          //   child: SwitchElement(
          //     title: "Напомнить мне о сне",
          //     isActive: true,
          //     value: remindToSleep,
          //     onChanged: (bool value) {
          //       context
          //           .read<SetSleepTimeDetailsBloc>()
          //           .remindToSleepSwitched(value);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
