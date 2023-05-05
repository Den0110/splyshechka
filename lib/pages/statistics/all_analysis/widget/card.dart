import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/indicators/circle_fill_indicator.dart';

class AnalysisCard extends StatelessWidget {
  final String date;
  final String sleepAll;
  final String goBed;
  final String awake;
  final double sleepQuality;
  final VoidCallback onTap;
  const AnalysisCard({
    super.key,
    required this.date,
    required this.sleepAll,
    required this.goBed,
    required this.awake,
    required this.sleepQuality,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: AppColors.greyMain,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: AppTextStyles.clockLetterStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          height: 18.h / 20.sp),
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.wentToBed,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            "Cпал всего: ${sleepAll}",
                            style: AppTextStyles.clockLetterStyle.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                height: 18.h / 16.sp),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.asleepAfter,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            "Заснул в:  $goBed",
                            style: AppTextStyles.clockLetterStyle.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                height: 18.h / 16.sp),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.wokeUp),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            "Проснулся в:  $awake",
                            style: AppTextStyles.clockLetterStyle.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                height: 18.h / 16.sp),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.mediumGrey.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      5.r,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Качество сна:',
                          style: AppTextStyles.clockSmallStyle
                              .copyWith(color: AppColors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CircleFillIndicator(
                          maxValue: 100,
                          minValue: 0,
                          value: sleepQuality,
                          indicatorRadius: 40.r,
                          widthIndicator: 9.r,
                          unit: "%",
                          fontSizeText: 18,
                          fontSizeUntil: 9,
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
