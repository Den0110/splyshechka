import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/result/widgets/alarm_result_container.dart';
import 'package:splyshechka/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:splyshechka/pages/alarm/result/widgets/value_with_icon.dart';
import 'package:splyshechka/pages/statistics/last_analys/bloc/last_statistic_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LastStatisticBloc>()
        ..add(
          const LastStatisticEvent.started(),
        ),
      child: Scaffold(
        body: BlocSideEffectConsumer<LastStatisticBloc, LastStatisticBloc,
          LastStatisticState, LastStatisticCommand>(
        listener: (context, sideEffect) {
          sideEffect.when(
            navToAllAnalyses: () {
              context.navigateTo(const AllAnalysisRoute());
            },
          );
        },
        builder: (context, state) => state.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.purple,
                ),
              )
            : state.sleep == null
                ? _NoData()
                : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 9.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Анализ последнего сна",
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamilyOpenSans,
                                fontSize: 16.sm,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(180, 180, 185, 1),
                                height: 23 / 16.sm,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 4.h),
                              decoration: BoxDecoration(
                                color: AppColors.mediumGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(11.r),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppColors.darkGrey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(11.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 9.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ValueWithIcon(
                                        icon: AppIcons.moon,
                                        title:
                                            "-${state.sleep!.slept_during.hour} ч",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 180.h,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AlarmResultContainer(
                                      title: "Качество",
                                      child: CircleFillIndicator(
                                        maxValue: 100,
                                        minValue: 0,
                                        value: state.sleep!.quality.toDouble(),
                                        indicatorRadius: 67.r,
                                        widthIndicator: 15.r,
                                        unit: "%",
                                        fontSizeText: 37,
                                        fontSizeUntil: 22,
                                        textColor: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0.w,
                                  ),
                                  Expanded(
                                    child: AlarmResultContainer(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      padding: EdgeInsets.only(
                                        left: 16.r,
                                        top: 16.r,
                                        right: 16.r,
                                        bottom: 31.r,
                                      ),
                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Длительность",
                                              style: AppTextStyles
                                                  .alarmSubtitleStyle,
                                            ),
                                            SizedBox(
                                              height: 9.h,
                                            ),
                                            Text(
                                              "${state.sleep!.slept_during.hour}ч ${state.sleep!.slept_during.minute}мин",
                                              style: AppTextStyles
                                                  .alarmDurationStyle,
                                            ),
                                            Text(
                                              "Спал всего",
                                              style: AppTextStyles
                                                  .alarmSubtitleStyle,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              "${state.sleep!.time_spent_in_bed.hour}ч ${state.sleep!.time_spent_in_bed.minute}мин",
                                              style: AppTextStyles
                                                  .alarmDurationStyle,
                                            ),
                                            Text(
                                              "В постели",
                                              style: AppTextStyles
                                                  .alarmSubtitleStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 140.h,
                              child: AlarmResultContainer(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                padding: EdgeInsets.only(
                                  top: 17.h,
                                  left: 30.h,
                                  right: 30.h,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CategoryWithIcon(
                                            title: "Отправился спать",
                                            icon: AppIcons.wentToBed,
                                            value:
                                                "${state.sleep!.went_sleep.hour}:${state.sleep!.went_sleep.minute}",
                                          ),
                                          SizedBox(height: 25.h),
                                          CategoryWithIcon(
                                            title: "Заснул после",
                                            icon: AppIcons.asleepAfter,
                                            value:
                                                "${state.sleep!.fell_asleep_during.minute + state.sleep!.fell_asleep_during.hour * 60} мин",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 26.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CategoryWithIcon(
                                            title: "Проснулся",
                                            icon: AppIcons.wokeUp,
                                            value:
                                                "${state.sleep!.waked_up_at.hour}:${state.sleep!.waked_up_at.minute}",
                                          ),
                                          SizedBox(height: 25.h),
                                          CategoryWithIcon(
                                            title: "Шум",
                                            icon: AppIcons.noise,
                                            value: "${state.sleep!.noise} дб",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            LargeButton(
                              text: "Вся статистика",
                              backgroundColor: AppColors.green,
                              shadowColor: AppColors.yellow,
                              textColor: AppColors.darkGreen,
                              onPressed: () {
                                context.router
                                    .navigate(const AllAnalysisRoute());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}

class _NoData extends StatelessWidget {
  const _NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Анализ последнего сна",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamilyOpenSans,
                fontSize: 16.sm,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(180, 180, 185, 1),
                height: 23 / 16.sm,
              ),
            ),
            Text(
              "Нет данных для анализа. Вам следует поспать!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamilyOpenSans,
                fontSize: 16.sm,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(180, 180, 185, 1),
                height: 23 / 16.sm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
