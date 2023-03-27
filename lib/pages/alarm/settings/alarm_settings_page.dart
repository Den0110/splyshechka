import 'package:auto_route/auto_route.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/bloc/sleep_time_details_cubit.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/widgets/sleep_time_options/alarm_options.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';

class AlarmSettingsPage extends StatelessWidget {
  const AlarmSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SleepTimeDetailsCubit>(),
      child: OneShotBlocConsumer<SleepTimeDetailsCubit, SleepTimeDetailsState>(
        listener: (context, state) {
          if (state is NavBack) {
            context.router.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Будильник"),
            ),
            body: Stack(
              children: [
                state.maybeWhen(
                  initial: (
                    bedtime,
                    wakeupTime,
                    remindToSleep,
                    alarmEnabled,
                    vibrationEnabled,
                    alarmVolume,
                    snoozeTime,
                    sleepGoal,
                    selectedTab,
                  ) {
                    return AlarmOptions(
                      wakeupTime: wakeupTime,
                      sleepGoal: sleepGoal,
                      alarmEnabled: alarmEnabled,
                      vibrationEnabled: vibrationEnabled,
                      volume: alarmVolume,
                      snoozeTime: snoozeTime,
                    );
                  },
                  orElse: Container.new,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LargeButton(
                          text: "Принять",
                          backgroundColor: AppColors.lightGreen,
                          shadowColor: AppColors.lemon,
                          textColor: AppColors.darkGreen,
                          onPressed: () {
                            context.read<SleepTimeDetailsCubit>().okayClicked();
                          },
                        ),
                        SizedBox(height: 6.h),
                        LargeButton(
                          text: "Отмена",
                          onPressed: () {
                            context.read<SleepTimeDetailsCubit>().okayClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
