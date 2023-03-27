import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmResultContainer extends StatelessWidget {
  const AlarmResultContainer({
    super.key,
    this.title,
    required this.child,
    this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            left: 16.r,
            top: 16.r,
            right: 16.r,
            bottom: 16.r,
          ),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          title != null
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title!,
                    style: AppTextStyles.alarmLabelStyle,
                  ),
                )
              : const SizedBox(),
          title != null ? const SizedBox() : const SizedBox(),
          child,
        ],
      ),
    );
  }
}
