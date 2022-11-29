import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ValueWithIcon extends StatelessWidget {
  const ValueWithIcon({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 26.r,
          width: 26.r,
        ),
        SizedBox(
          width: 8.h,
        ),
        Text(
          title,
          style: AppTextStyles.alarmValueStyle,
        ),
      ],
    );
  }
}
