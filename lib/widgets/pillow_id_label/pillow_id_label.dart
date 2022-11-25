import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_text_styles.dart';

class PillowIdLabel extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? iconSize;

  const PillowIdLabel({
    Key? key,
    required this.text,
    this.padding,
    this.fontSize,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: 5.h,
            bottom: 5.h,
            left: 5.w,
            right: 7.w,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.r),
        color: AppColors.mediumGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppIcons.sharp,
            height: iconSize ?? 14.r,
            width: iconSize ?? 14.r,
          ),
          SizedBox(width: 5.w),
          Text(
            text,
            style: AppTextStyles.pillowCode.copyWith(fontSize: fontSize),
          )
        ],
      ),
    );
  }
}
