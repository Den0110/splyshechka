import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class SleepContainer extends StatelessWidget {
  SleepContainer(
      {super.key,
      this.topLabel,
      this.bottomLabel,
      required this.child,
      this.leftPadding,
      this.textStyle});

  final String? topLabel;
  final String? bottomLabel;
  final Widget child;
  final double? leftPadding;
  final TextStyle? textStyle;

  final double _defaultLeftPadding = 16.0.w;
  final TextStyle _defaultTextStyle =
      AppTextStyles.containerLabelStyle.copyWith(color: AppColors.lightGrey);

  double get _currentLeftPadding {
    return leftPadding ?? _defaultLeftPadding;
  }

  TextStyle get _currentTextStyle {
    return textStyle ?? _defaultTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topLabel != null
            ? Padding(
                padding:
                    EdgeInsets.only(left: _currentLeftPadding, bottom: 8.0.h),
                child: Text(
                  topLabel!,
                  style: AppTextStyles.containerLabelStyle
                      .copyWith(color: AppColors.lightGrey),
                ),
              )
            : const SizedBox(),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: AppColors.darkGrey,
            child: child,
          ),
        ),
        bottomLabel != null
            ? Padding(
                padding: EdgeInsets.only(left: _currentLeftPadding, top: 8.0.h),
                child: Text(
                  bottomLabel!,
                  style: _currentTextStyle,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
