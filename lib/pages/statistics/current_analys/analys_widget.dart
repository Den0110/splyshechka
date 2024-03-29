import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
import 'package:splyshechka/pages/alarm/result/widgets/alarm_result_container.dart';
import 'package:splyshechka/pages/alarm/result/widgets/category_with_icon.dart';
import 'package:splyshechka/pages/alarm/result/widgets/value_with_icon.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/date_formatter.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';

class CurrentAnalysPage extends StatelessWidget {
  final SleepDto sleep;
  const CurrentAnalysPage({super.key, required this.sleep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 9.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sleep.went_sleep.toRusFormat(),
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamilyOpenSans,
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(180, 180, 185, 1),
              height: 23.h / 23.sp,
            ),
          ),
          SizedBox(height: 10.h),
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
                      title: "${getHours(sleep.slept_during)} ч",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: AlarmResultContainer(
                  title: "Качество",
                  child: CircleFillIndicator(
                    maxValue: 100,
                    minValue: 0,
                    value: sleep.quality.toDouble(),
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
                  padding: EdgeInsets.only(
                    left: 16.r,
                    top: 16.r,
                    right: 16.r,
                    bottom: 31.r,
                  ),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Длительность",
                          style: AppTextStyles.alarmSubtitleStyle,
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "${getHours(sleep.slept_during)} ч ${getMinutes(sleep.slept_during)} мин",
                          style: AppTextStyles.alarmDurationStyle,
                        ),
                        Text(
                          "Спал всего",
                          style: AppTextStyles.alarmSubtitleStyle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "${getHours(sleep.time_spent_in_bed)}ч ${getMinutes(sleep.time_spent_in_bed)}мин",
                          style: AppTextStyles.alarmDurationStyle,
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
          SizedBox(
            height: 10.h,
          ),
          AlarmResultContainer(
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.only(
              top: 17.h,
              left: 30.h,
              right: 30.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWithIcon(
                      title: "Отправился спать",
                      icon: AppIcons.wentToBed,
                      value:
                          "${sleep.went_sleep.hour}:${sleep.went_sleep.minute}",
                    ),
                    CategoryWithIcon(
                      title: "Проснулся",
                      icon: AppIcons.wokeUp,
                      value:
                          "${sleep.waked_up_at.hour}:${sleep.waked_up_at.minute}",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWithIcon(
                      title: "Заснул после",
                      icon: AppIcons.asleepAfter,
                      value:
                          "${sleep.fell_asleep_during} мин",
                    ),
                    CategoryWithIcon(
                      title: "Шум",
                      icon: AppIcons.noise,
                      value: "${sleep.noise} дб",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
