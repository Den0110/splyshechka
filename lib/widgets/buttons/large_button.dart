import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class LargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? shadowColor;
  final String text;
  final Color? textColor;
  final Widget? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final bool isActive;

  const LargeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(11.r)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(bottom: 4.h),
          width: double.infinity,
          color: shadowColor,
          child: Container(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 15.h,
              left: 16.w,
              right: 16.w,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(11.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: icon,
                  ),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.buttonLargeStyle
                        .copyWith(color: textColor ?? AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
