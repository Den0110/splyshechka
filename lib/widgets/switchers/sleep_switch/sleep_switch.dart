import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_pillow/utils/app_colors.dart';

class SleepSwitch extends StatelessWidget {
  const SleepSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 41.w,
      height: 23.h,
      toggleSize: 19.w,
      padding: 2.r,
      toggleColor: AppColors.darkGrey.withOpacity(0.8),
      activeColor: AppColors.green,
      inactiveColor: AppColors.blue,
      value: value,
      onToggle: onChanged,
    );
  }
}