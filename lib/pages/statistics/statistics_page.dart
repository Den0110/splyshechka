import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:splyshechka/pages/alarm/result/widgets/alarm_result_container.dart';
import 'package:splyshechka/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:splyshechka/pages/alarm/result/widgets/value_with_icon.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 9.h),
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
                          title: "-${const SleepTime(h: 7, m: 52).h} ч",
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
                          value: 100.toDouble(),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: "Длительность",
                        padding: EdgeInsets.only(
                          left: 16.r,
                          top: 16.r,
                          right: 16.r,
                          bottom: 31.r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${const SleepTime(h: 7, m: 52).h} h ${const SleepTime(h: 7, m: 52).m} мин",
                              style: AppTextStyles.alarmDurationStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Спал всего",
                              style: AppTextStyles.alarmSubtitleStyle,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "${const SleepTime(h: 8, m: 12).h} ч ${const SleepTime(h: 8, m: 12).m} мин",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryWithIcon(
                              title: "Отправился спать",
                              icon: AppIcons.wentToBed,
                              value:
                                  "${const SleepTime(h: 23, m: 48).h}:${const SleepTime(h: 23, m: 48).m}",
                            ),
                            SizedBox(height: 25.h),
                            CategoryWithIcon(
                              title: "Заснул после",
                              icon: AppIcons.asleepAfter,
                              value:
                                  "${const SleepTime(h: 0, m: 5).m + const SleepTime(h: 0, m: 5).h * 60} мин",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 26.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryWithIcon(
                              title: "Проснулся",
                              icon: AppIcons.wokeUp,
                              value:
                                  "${const SleepTime(h: 9, m: 32).h}:${const SleepTime(h: 9, m: 32).m}",
                            ),
                            SizedBox(height: 25.h),
                            const CategoryWithIcon(
                              title: "Шум",
                              icon: AppIcons.noise,
                              value: "${30} дб",
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
    );
  }
}
