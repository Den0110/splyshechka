import 'package:auto_route/auto_route.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/pages/alarm/result/bloc/alarm_result_page_bloc.dart';
import 'package:splyshechka/pages/alarm/result/widgets/alarm_result_container.dart';
import 'package:splyshechka/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:splyshechka/pages/alarm/result/widgets/value_with_icon.dart';

class AlarmResultPage extends StatelessWidget {
  const AlarmResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlarmResultPageBloc()..add(const LoadStarted()),
      child: BlocBuilder<AlarmResultPageBloc, AlarmResultPageState>(
        builder: (context, state) {
          if (state is AlarmResultPageDataLoaded) {
            return Scaffold(
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 9.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
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
                                      title: "-${state.totalSleep.h} ч",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 204.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AlarmResultContainer(
                                    title: "Качество",
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
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: AlarmResultContainer(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    title: "Длительность",
                                    padding: EdgeInsets.only(
                                      left: 16.r,
                                      top: 16.r,
                                      right: 16.r,
                                      bottom: 31.r,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state.totalSleep.h} ч ${state.totalSleep.m} мин",
                                          style:
                                              AppTextStyles.alarmDurationStyle,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Всего спал",
                                          style:
                                              AppTextStyles.alarmSubtitleStyle,
                                        ),
                                        Text(
                                          "${state.inBed.h} ч ${state.inBed.m} мин",
                                          style:
                                              AppTextStyles.alarmDurationStyle,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "В постели",
                                          style:
                                              AppTextStyles.alarmSubtitleStyle,
                                        ),
                                      ],
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
                                              "${state.wentToBed.h}:${state.wentToBed.m}",
                                        ),
                                        SizedBox(height: 25.h),
                                        CategoryWithIcon(
                                          title: "Заснул в течение",
                                          icon: AppIcons.asleepAfter,
                                          value:
                                              "${state.asleepAfter.m + state.asleepAfter.h * 60} мин",
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
                                          title: "Проснулся в",
                                          icon: AppIcons.wokeUp,
                                          value:
                                              "${state.wokeUp.h}:${state.wokeUp.m}",
                                        ),
                                        SizedBox(height: 25.h),
                                        CategoryWithIcon(
                                          title: "Шум",
                                          icon: AppIcons.noise,
                                          value: "${state.noise} дб",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 1.sw,
                            height: 201.h,
                            child: AlarmResultContainer(
                              child: Image.asset(
                                'assets/images/chart.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.0.w,
                        right: 12.0.w,
                        bottom: 16.h,
                      ),
                      child: LargeButton(
                        text: "Принять",
                        textColor: AppColors.darkGreen,
                        onPressed: () {
                          context.router.pushAndPopUntil(
                            const MainRoute(),
                            predicate: (_) => false,
                          );
                        },
                        backgroundColor: AppColors.green,
                        shadowColor: AppColors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
