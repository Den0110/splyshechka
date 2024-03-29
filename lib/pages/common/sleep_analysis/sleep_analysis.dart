import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/domain/models/achievements/achievement_list.dart';
import 'package:splyshechka/pages/achievements/widgets/achievement_dialog/achevement_get_dialog.dart';
import 'package:splyshechka/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:splyshechka/pages/alarm/result/widgets/value_with_icon.dart';
import 'package:splyshechka/pages/common/sleep_analysis/bloc/sleep_analysis_bloc.dart';
import 'package:splyshechka/pages/common/sleep_analysis/widgets/sleep_chart.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/containers/alarm_result_container.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';

class SleepAnalysis extends StatelessWidget {
  final String filePath;

  const SleepAnalysis({
    Key? key,
    required this.filePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SleepAnalysisBloc>()..add(SleepAnalysisEvent.started(filePath)),
      child: BlocSideEffectConsumer<
          SleepAnalysisBloc,
          SleepAnalysisBloc,
          SleepAnalysisState,
          SleepAnalysisCommand>(listener: (state, sideEffect) {
        if (state is OpenDialog) {
          (index) => showDialog(
                context: context,
                builder: (BuildContext context) => AcheievementGetDialog(
                  onPressed: () => context.router.pop(),
                  header: Achievements.achievements[index-1].headerText,
                  icon: Achievements.achievements[index-1].image,
                ),
              );
        }
      }, builder: (context, state) {
        return Column(children: [
          // InkWell(
          //   child: Padding(
          //     padding: EdgeInsets.all(16.r),
          //     child: const Text(
          //       "Reload",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: AppColors.purple,
          //       ),
          //     ),
          //   ),
          //   onTap: () => context
          //       .read<SleepAnalysisBloc>()
          //       .add(SleepAnalysisEvent.started(filePath)),
          // ),
          state.map(
              loading: (_) => const CircularProgressIndicator(),
              loaded: (state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0.w,
                  ),
                  child: Column(
                    children: [
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ValueWithIcon(
                                  icon: AppIcons.moon,
                                  title: "${state.totalSleep.h} ч",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 204.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: IntrinsicHeight(
                                child: AlarmResultContainer(
                                  title: "Качество",
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: CircleFillIndicator(
                                      maxValue: 100,
                                      minValue: 0,
                                      value: state.quality.toDouble(),
                                      indicatorRadius: 67.r,
                                      widthIndicator: 15.r,
                                      unit: "%",
                                      fontSizeText: 37,
                                      fontSizeUntil: 22,
                                      textColor: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0.w,
                            ),
                            Expanded(
                              child: IntrinsicHeight(
                                child: AlarmResultContainer(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  title: "Длительность",
                                  padding: EdgeInsets.only(
                                    left: 16.r,
                                    top: 16.r,
                                    right: 16.r,
                                    bottom: 31.r,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "${state.totalSleep.h} ч ${state.totalSleep.m} мин",
                                        style: AppTextStyles.alarmDurationStyle,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Всего спал",
                                        style: AppTextStyles.alarmSubtitleStyle,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "${state.inBed.h} ч ${state.inBed.m} мин",
                                        style: AppTextStyles.alarmDurationStyle,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "В постели",
                                        style: AppTextStyles.alarmSubtitleStyle,
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
                      IntrinsicHeight(
                        child: AlarmResultContainer(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          padding: EdgeInsets.only(
                            top: 17.h,
                            left: 30.h,
                            right: 30.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryWithIcon(
                                    title: "Отправился спать",
                                    icon: AppIcons.wentToBed,
                                    value: state.wentToBed.toStringWithColon(),
                                  ),
                                  CategoryWithIcon(
                                    title: "Проснулся",
                                    icon: AppIcons.wokeUp,
                                    value: state.wokeUp.toStringWithColon(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryWithIcon(
                                    title: "Заснул после",
                                    icon: AppIcons.asleepAfter,
                                    value:
                                        "${state.asleepAfter.m + state.asleepAfter.h * 60} мин",
                                  ),
                                  CategoryWithIcon(
                                    title: "Шум",
                                    icon: AppIcons.noise,
                                    value: "${state.noise} дб",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AlarmResultContainer(
                        child: SizedBox(
                          height: 201.h,
                          child: SleepChart(
                            sleepRecords: state.chartSleepData,
                            labels: state.chartLabels,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
        ]);
      }),
    );
  }
}
