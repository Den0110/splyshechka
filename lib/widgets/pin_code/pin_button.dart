import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';

class PinButton extends StatelessWidget {
  const PinButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        height: 55.r,
        width: 55.r,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(label, style: AppTextStyles.pinStyle),
        ),
      ),
    );
  }
}
