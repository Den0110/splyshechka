import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class PinProgress extends StatelessWidget {
  const PinProgress({super.key, required this.length, required this.filled});

  final int length;
  final int filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 11.h,
      width: 11.h * length + 13.w * (length - 1),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          height: 11.h,
          width: 11.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            shape: BoxShape.circle,
            color: index < filled ? AppColors.lightGrey : Colors.transparent,
          ),
          child: const Center(),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 13.w,
        ),
        itemCount: length,
      ),
    );
  }
}
