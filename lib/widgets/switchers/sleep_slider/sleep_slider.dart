import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/sleep_thumb_shape.dart';

class SleepSlider extends StatelessWidget {
  const SleepSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
    this.showValueLabel = true,
  });

  final double minValue;
  final double maxValue;
  final double value;
  final void Function(double) onChanged;
  final bool showValueLabel;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        trackHeight: 10.h,
        thumbShape: SleepThumbShape(val: value, showValueLabel: showValueLabel),
        activeTrackColor: AppColors.green,
        inactiveTrackColor: AppColors.mediumGrey,
      ),
      child: Slider(
        min: minValue,
        max: maxValue,
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}