import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class SleepCheckbox extends StatelessWidget {
  const SleepCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onChanged,
      child: SizedBox(
        height: 30.h,
        width: 30.w,
        child: Center(
          child: Container(
            height: 18.h,
            decoration: BoxDecoration(
              color: value ? AppColors.green : AppColors.mediumGrey,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(3.r),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.darkGrey.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}