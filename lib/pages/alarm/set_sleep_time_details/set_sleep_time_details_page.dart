import 'package:auto_route/auto_route.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/bloc/set_sleep_time_details_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/switchers/pick_option/pick_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/widgets/sleep_time_options/alarm_options.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/widgets/sleep_time_options/bedtime_options.dart';

class SetSleepTimeDetailsWentPage extends StatelessWidget {
  const SetSleepTimeDetailsWentPage({
    super.key,
    required this.initial,
  });

  final SleepTimeType initial;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SetSleepTimeDetailsBloc>(),
      child: BlocSideEffectConsumer<
          SetSleepTimeDetailsBloc,
          SetSleepTimeDetailsBloc,
          SetSleepTimeDetailsState,
          SetSleepTimeDetailsCommand>(
        listener: (context, state) {
          if (state is NavBack) {
            context.router.pop();
          } else if (state is NavToSnooze) {
            context.router.navigate(
              const SnoozeRoute(),
            );
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
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
              return Scaffold(
                appBar: AppBar(
                  title: PickOption(
                    options: SleepTimeType.values.map((e) => e.name).toList(),
                    active: selectedTab.index,
                    optionStyle: OptionStyle.backgroundStyle,
                    onTap: (i) {
                      BlocProvider.of<SetSleepTimeDetailsBloc>(context)
                          .selectTab(SleepTimeType.values[i]);
                    },
                  ),
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: selectedTab == SleepTimeType.bedtime
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: BedtimeOptions(
                                bedtime: bedtime,
                                sleepGoal: sleepGoal,
                                remindToSleep: remindToSleep,
                              ),
                            )
                          : AlarmOptions(
                              wakeupTime: wakeupTime,
                              sleepGoal: sleepGoal,
                              alarmEnabled: alarmEnabled,
                              vibrationEnabled: vibrationEnabled,
                              volume: alarmVolume,
                              snoozeTime: snoozeTime,
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 16.h,
                        ),
                        child: LargeButton(
                          onPressed: () {
                            context
                                .read<SetSleepTimeDetailsBloc>()
                                .okayClicked();
                          },
                          text: "Принять",
                          backgroundColor: AppColors.white,
                          textColor: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: Container.new,
          );
        },
      ),
    );
  }
}
