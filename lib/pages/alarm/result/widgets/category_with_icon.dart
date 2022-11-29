import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryWithIcon extends StatelessWidget {
  const CategoryWithIcon({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.alarmSubtitleStyle,
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: SvgPicture.asset(
                icon,
                height: 16.r,
                width: 16.r,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              value,
              style: AppTextStyles.alarmValueStyle,
            ),
          ],
        ),
      ],
    );
  }
}
