import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';

class TimeSelection extends StatelessWidget {
  const TimeSelection({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.onTap,
  });

  final String icon;
  final String title;
  final SleepTime time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 12.5.r,
                width: 12.5.r,
                color: AppColors.yellow,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                title,
                style: AppTextStyles.timeSelectionLabelStyle.copyWith(
                  color: AppColors.yellow,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: time.toStringWithColon(),
                  style: AppTextStyles.timeSelectionNumberStyle,
                ),
                TextSpan(
                  text: " am",
                  style: AppTextStyles.clockLetterStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SvgPicture.asset(
            AppIcons.editCircle,
            height: 17.r,
            width: 17.r,
          ),
        ],
      ),
    );
  }
}
