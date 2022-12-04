import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class YellowRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const YellowRoundedButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: AppColors.yellow,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 28.w),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
