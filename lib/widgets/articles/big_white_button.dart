import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';

class BigWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigWhiteButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 26,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sm,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
