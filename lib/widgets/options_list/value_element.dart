
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';

class ValueElement extends StatelessWidget {
  const ValueElement({
    super.key,
    required this.title,
    this.titleColor,
    this.subTitle,
    required this.isActive,
    this.icon,
    this.value,
    this.valueColor,
    this.onTap,
    this.verticalPadding,
  });

  final String title;
  final Color? titleColor;
  final String? subTitle;
  final bool isActive;
  final Widget? icon;
  final Object? value;
  final Color? valueColor;
  final VoidCallback? onTap;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ListElement(
      verticalPadding: verticalPadding,
      title: title,
      subtitle: subTitle,
      titleColor: titleColor,
      isActive: isActive,
      icon: icon,
      onTap: onTap,
      child: value != null
          ? Row(
              children: [
                Text(
                  value.toString(),
                  style: AppTextStyles.bodyStyle.copyWith(
                    color: valueColor ?? AppColors.white,
                  ),
                ),
                SizedBox(width: 0.h),
              ],
            )
          : null,
    );
  }
}
