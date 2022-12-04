

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/options_list/active_widget.dart';

class SmallButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? shadowColor;
  final String text;
  final Color? textColor;
  final double? textSize;
  final bool isActive;
  final void Function()? onPressed;

  const SmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isActive=true,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActiveWidget(
      isActive:isActive ,
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.only(bottom: 2.5.h),
          decoration: BoxDecoration(
            color: shadowColor,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.buttonSmallStyle.copyWith(
                color: textColor ?? AppColors.white,
                fontSize: textSize ?? 13.sp,
                height: 22.h / (textSize ?? 13.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
