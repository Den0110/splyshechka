
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        height: 30.h,
        width: 30.w,
        child: Center(
          child: Container(
            height: 18.h,
            decoration: const BoxDecoration(
              color: AppColors.mediumGrey,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(3.r),
            child: Center(
              child: Icon(
                Icons.question_mark,
                color: AppColors.lightGrey,
                size: 12.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
