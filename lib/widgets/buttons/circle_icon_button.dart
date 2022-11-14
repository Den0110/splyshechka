

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Color? borderColor;
  final double? radius;

  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.radius,
    this.borderColor = AppColors.lightBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: borderColor,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(radius ?? 5.r),
          child: icon,
        ),
      ),
    );
  }
}
