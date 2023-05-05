import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/switchers/pick_option/option.dart';

class BackgroundOption extends Option {
  const BackgroundOption({
    super.key,
    super.color,
    required super.isActive,
    required super.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? color ?? AppColors.brandMain : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Text(
          value,
          style: TextStyle(
            color:
                isActive & (color == null) ? AppColors.black : AppColors.white,
            letterSpacing: -0.408.w,
            fontSize: 13.sp,
            height: 17.h / 13.sp,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            fontFamily: AppTextStyles.fontFamilyOpenSans,
          ),
        ),
      ),
    );
  }
}
