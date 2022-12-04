import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/good_morning/bloc/good_morning_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';

class GoodMorningPage extends StatelessWidget {
  const GoodMorningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoodMorningBloc(),
      child: OneShotBlocConsumer<GoodMorningBloc, GoodMorningState>(
        listener: (context, state) {
          state.whenOrNull(
            delay: () {
              context.router.pushAndPopUntil(
                const MainRoute(),
                predicate: (_) => false,
              );
            },
            wakeUp: () {
              context.router.navigate(const AlarmResultRoute());
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (dateTime) {
              String dateString = DateFormat("EEEE, MMM d").format(dateTime);
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
                          "Good morning!",
                          style: AppTextStyles.alarmTitle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: timeString,
                                style: AppTextStyles.alarmNumber.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: " am",
                                style: AppTextStyles.alarmLetter.copyWith(
                                  color: AppColors.black,
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
                          style: AppTextStyles.alarmSubtitle,
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
                          text: "Delay",
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
                          text: "Wake up",
                          textColor: AppColors.black,
                          backgroundColor: AppColors.white,
                          shadowColor: AppColors.black,
                          onPressed: () {
                            context
                                .read<GoodMorningBloc>()
                                .add(const Delayed());
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
