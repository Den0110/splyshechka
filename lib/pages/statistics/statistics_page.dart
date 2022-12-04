import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time.dart';
import 'package:my_pillow/pages/alarm/result/widgets/alarm_result_container.dart';
import 'package:my_pillow/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:my_pillow/pages/alarm/result/widgets/value_with_icon.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/indicators/circle_fill_indicator.dart';

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
              SizedBox(
                height: 60.r,
                width: 60.r,
                child: Image.asset(
                  "assets/images/pillow.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              //Slightly modified large button
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
                          icon: AppIcons.coinCircle,
                          title: "+${8.40.toStringAsFixed(2)}",
                        ),
                        const ValueWithIcon(
                          icon: AppIcons.box,
                          title: "x1",
                        ),
                        ValueWithIcon(
                          icon: AppIcons.moon,
                          title: "-${const SleepTime(h: 7, m: 52).h} h",
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
                        title: "Quality",
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
                        title: "Duration",
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
                              "${const SleepTime(h: 7, m: 52).h} h ${const SleepTime(h: 7, m: 52).m} m",
                              style: AppTextStyles.alarmDurationStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Total sleep",
                              style: AppTextStyles.alarmSubtitleStyle,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "${const SleepTime(h: 8, m: 12).h} h ${const SleepTime(h: 8, m: 12).m} m",
                              style: AppTextStyles.alarmDurationStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "In bed",
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
                              title: "Went to bed",
                              icon: AppIcons.wentToBed,
                              value:
                                  "${const SleepTime(h: 23, m: 48).h}:${const SleepTime(h: 23, m: 48).m}",
                            ),
                            SizedBox(height: 25.h),
                            CategoryWithIcon(
                              title: "Aleep after",
                              icon: AppIcons.asleepAfter,
                              value:
                                  "${const SleepTime(h: 0, m: 5).m + const SleepTime(h: 0, m: 5).h * 60} min",
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
                              title: "Woke up",
                              icon: AppIcons.wokeUp,
                              value:
                                  "${const SleepTime(h: 9, m: 32).h}:${const SleepTime(h: 9, m: 32).m} am",
                            ),
                            SizedBox(height: 25.h),
                            const CategoryWithIcon(
                              title: "Noise",
                              icon: AppIcons.noise,
                              value: "${30} db",
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
                child: const AlarmResultContainer(
                  child: Text("sleep_plot_placeholder"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
