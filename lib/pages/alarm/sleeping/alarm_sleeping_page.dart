import 'package:auto_route/auto_route.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/buttons/large_button.dart';
import 'package:my_pillow/widgets/options_list/value_element.dart';
import 'package:my_pillow/widgets/sleep_container/sleep_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_pillow/di/locator.dart';
import 'package:my_pillow/navigation/auto_router.gr.dart';
import 'package:my_pillow/pages/alarm/sleeping/bloc/alarm_sleeping_cubit.dart';
import 'package:my_pillow/pages/alarm/sleeping/widgets/sound_listener.dart';
import 'package:my_pillow/utils/one_shot_bloc.dart';

class AlarmSleepingPage extends StatelessWidget {
  const AlarmSleepingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AlarmSleepingCubit>(),
      child: OneShotBlocConsumer<AlarmSleepingCubit, AlarmSleepingState>(
        listener: (context, state) {
          if (state is NavToResults) {
            context.router.navigate(const AlarmResultRoute());
          } else if (state is NavToAlarm) {
            context.router.navigate(const AlarmSettingsRoute());
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (currentDate, alarmTime, currentVolume) {
              String dateString = DateFormat("EEEE, MMM d").format(currentDate);
              String timeString =
                  DateFormat(DateFormat.HOUR24_MINUTE).format(currentDate);
              return Scaffold(
                body: Column(
                  children: [
                    SizedBox(
                      height: 77.h,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: timeString,
                            style: AppTextStyles.alarmNumber.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          TextSpan(
                            text: " am",
                            style: AppTextStyles.alarmLetter.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      dateString,
                      style: AppTextStyles.alarmSubtitle.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.w),
                      child: SleepContainer(
                        child: ValueElement(
                          title: "Alarm",
                          isActive: true,
                          value: alarmTime,
                          onTap: () {
                            context.read<AlarmSleepingCubit>().alarmClicked();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 115.h,
                    ),
                    SoundListener(
                      waveHeight: currentVolume.toDouble(),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    SvgPicture.asset(
                      AppIcons.mic,
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    LargeButton(
                      text: "Wake up",
                      textColor: AppColors.black,
                      backgroundColor: AppColors.white,
                      shadowColor: AppColors.black,
                      onPressed: () {
                        context.read<AlarmSleepingCubit>().wakeUpClicked();
                      },
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
