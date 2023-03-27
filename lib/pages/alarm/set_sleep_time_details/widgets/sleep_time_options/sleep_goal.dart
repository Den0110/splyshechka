import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/domain/entities/alarm/sleep_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SleepGoal extends StatelessWidget {
  final SleepTime goal;

  const SleepGoal({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Ваша цель проспать "),
        TextSpan(
          text: goal.toString(),
          style: TextStyle(
            fontFamily: AppTextStyles.fontFamilyOpenSans,
            color: AppColors.lightGreen,
            fontWeight: FontWeight.w700,
            height: 18.h / 13.sp,
            fontSize: 13.sp,
          ),
        ),
        const TextSpan(text: "\nОсновано на вашем времени сна и будильника"),
      ]),
      style: AppTextStyles.alarmDescriptionStyle,
      textAlign: TextAlign.center,
    );
  }
}
