import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/switchers/pick_option/option.dart';

class HighlightOption extends Option {
  const HighlightOption({
    super.key,
    required super.isActive,
    required super.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.5.w),
      child: isActive
          ? Text(
              value,
              style: AppTextStyles.boldOptionStyle.copyWith(
                color: AppColors.white,
              ),
            )
          : Text(
              value,
              style: AppTextStyles.optionStyle.copyWith(
                color: AppColors.lightGrey.withOpacity(0.6),
              ),
            ),
    );
  }
}
