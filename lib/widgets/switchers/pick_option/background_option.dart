import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/switchers/pick_option/option.dart';

class BackgroundOption extends Option {
  const BackgroundOption({
    super.key,
    required super.isActive,
    required super.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Center(
        child: Text(
          value,
          style: AppTextStyles.boldOptionStyle.copyWith(
            color: isActive ? AppColors.black : AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}
