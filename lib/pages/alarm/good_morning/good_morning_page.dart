import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:splyshechka/data/repository/alarm_repository_impl.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/good_morning/bloc/good_morning_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/date_formatter.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/clock/clock_widget.dart';

class GoodMorningPage extends StatelessWidget {
  const GoodMorningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GoodMorningBloc>(),
      child: OneShotBlocConsumer<GoodMorningBloc, GoodMorningState>(
        listener: (context, state) {
          state.whenOrNull(
            delay: () {
              context.router.pop();
            },
            wakeUp: () {
              context.router.navigate(const AlarmResultRoute());
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (dateTime) {
              String dateString = dateTime.toRusWeekFormat();
              String timeString =
                  DateFormat(DateFormat.HOUR24_MINUTE).format(dateTime);
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.lightGreen,
                      AppColors.lemon,
                    ],
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: EdgeInsets.only(
                      left: 25.w,
                      right: 25.w,
                      bottom: 21.h,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 62.h,
                        ),
                        Text(
                          "Доброе утро!",
                          style: AppTextStyles.alarmTitle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const ClockWidget(
                          color: AppColors.black,
                        ),
                        SizedBox(
                          height: 146.h,
                        ),
                        Container(
                          height: 154.r,
                          width: 154.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lemon,
                          ),
                        ),
                        const Spacer(),
                        LargeButton(
                          text: "Отложить",
                          textColor: AppColors.white,
                          backgroundColor: AppColors.black,
                          shadowColor: AppColors.white,
                          onPressed: () {
                            context
                                .read<GoodMorningBloc>()
                                .add(const Delayed());
                          },
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        LargeButton(
                          text: "Проснуться",
                          textColor: AppColors.black,
                          backgroundColor: AppColors.white,
                          shadowColor: AppColors.black,
                          onPressed: () {
                            context.read<GoodMorningBloc>().add(const WokeUp());
                          },
                        ),
                      ],
                    ),
                  ),
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
