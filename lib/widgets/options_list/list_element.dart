
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/options_list/active_widget.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    super.key,
    this.title,
    required this.isActive,
    this.onTap,
    this.subtitle,
    this.icon,
    this.titleColor,
    this.child,
    this.arrowIfTappable = true,
    this.rightPadding = 10.0,
    this.leftPadding,
    this.verticalPadding,
    this.iconSize,
  });

  final String? title;
  final bool isActive;
  final VoidCallback? onTap;
  final String? subtitle;
  final Widget? child;
  final Color? titleColor;
  final Widget? icon;
  final bool arrowIfTappable;
  final double rightPadding;
  final double? leftPadding;
  final double? verticalPadding;
  final Size? iconSize;

  static final _defaultLeftPadding = 16.w;
  static final _defaultVerticalPadding = 11.h;

  double get _verticalPadding {
    return verticalPadding ?? _defaultVerticalPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActiveWidget(
          onTap: onTap,
          isActive: isActive,
          child: Padding(
            padding: EdgeInsets.only(
              left: leftPadding ?? _defaultLeftPadding,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: 10.0.w,
                          ),
                          child: SizedBox(
                            height: iconSize?.height,
                            width: iconSize?.width,
                            child: icon,
                          ),
                        )
                      : const Center(),
                  title != null
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: _verticalPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title!,
                                  style: AppTextStyles.bodyStyle.copyWith(
                                    color: titleColor ?? AppColors.white,
                                  ),
                                ),
                                subtitle != null
                                    ? Text(
                                        subtitle!,
                                        style: AppTextStyles.subtitleStyle
                                            .copyWith(
                                          color: (titleColor ?? AppColors.white)
                                              .withOpacity(0.5),
                                        ),
                                      )
                                    : const Center(),
                              ],
                            ),
                          ),
                        )
                      : const Center(),
                  child ?? const Center(),
                  (onTap != null && arrowIfTappable)
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                          size: 19.r,
                        )
                      : const Center(),
                  SizedBox(
                    width: rightPadding.w,
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(left: leftPadding ?? _defaultLeftPadding),
            child: const Divider(
              thickness: 0.5,
              height: 0,
              color: AppColors.brightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
