import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/widgets/sleep_time_options/sleep_goal.dart';
import 'package:splyshechka/pages/alarm/settings/bloc/alarm_settings_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/options_list/slider_element.dart';
import 'package:splyshechka/widgets/options_list/switch_element.dart';
import 'package:splyshechka/widgets/options_list/value_element.dart';
import 'package:splyshechka/widgets/sleep_time_picker/sleep_time_picker.dart';

class AlarmSettingsPage extends StatelessWidget {
  const AlarmSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AlarmSettingsBloc>()..add(Started()),
      child: BlocSideEffectConsumer<AlarmSettingsBloc, AlarmSettingsBloc,
          AlarmSettingsState, AlarmSettingsCommand>(
        listener: (context, state) {
          if (state is NavBack) {
            context.router.pop();
          }
          if (state is NavToSnooze) {
            context.router.navigate(
              const SnoozeRoute(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Будильник"),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SleepTimePicker(
                        initialHour: state.wakeupTime.h,
                        initialMin: state.wakeupTime.m,
                        onTimeChanged: (h, m) {
                          context.read<AlarmSettingsBloc>().alarmTimeChanged(
                                SleepTime(
                                  h: h,
                                  m: m,
                                ),
                              );
                        },
                      ),
                      SizedBox(height: 30.h),
                      SleepGoal(goal: state.sleepGoal),
                      SizedBox(height: 30.h),
                      SleepContainer(
                        child: SwitchElement(
                          title: "Будильник",
                          isActive: true,
                          value: state.alarmEnabled,
                          onChanged: (bool value) {
                            context
                                .read<AlarmSettingsBloc>()
                                .alarmSwitched(value);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      if (state.alarmEnabled) ...[
                        SleepContainer(
                          child: Column(
                            children: [
                              SwitchElement(
                                title: "Вибрация",
                                isActive: true,
                                value: state.vibrationEnabled,
                                onChanged: (bool value) {
                                  context
                                      .read<AlarmSettingsBloc>()
                                      .vibrationSwitched(value);
                                },
                              ),
                              // SliderElement(
                              //   icon: SvgPicture.asset(AppIcons.volume),
                              //   minValue: 0,
                              //   value: state.alarmVolume,
                              //   maxValue: 100,
                              //   isActive: true,
                              //   onChanged: (double value) {
                              //     context
                              //         .read<AlarmSettingsBloc>()
                              //         .volumeChanged(value);
                              //   },
                              // ),

                              ValueElement(
                                title: "Отложить",
                                isActive: true,
                                onTap: () {
                                  context
                                      .read<AlarmSettingsBloc>()
                                      .snoozeChanged();
                                },
                                value: state.snoozeTime,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                  context
                                      .read<AlarmSettingsBloc>()
                                      .okayClicked();
                                },
                              ),
                              SizedBox(height: 6.h),
                              LargeButton(
                                text: "Отмена",
                                onPressed: () {
                                  context
                                      .read<AlarmSettingsBloc>()
                                      .cancelClicked();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
