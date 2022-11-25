
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/switchers/sleep_slider/sleep_slider.dart';

class SliderElement extends StatelessWidget {
  const SliderElement({
    super.key,
    required this.isActive,
    required this.value,
    this.iconAsset,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  final bool isActive;
  final double value;
  final double minValue;
  final double maxValue;
  final void Function(double) onChanged;
  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    return ListElement(
      isActive: isActive,
      iconAsset: iconAsset,
      rightPadding: 0.0,
      child: SizedBox(
        width: 280.w,
        height: 45.h,
        child: SleepSlider(
          value: value,
          maxValue: maxValue,
          minValue: minValue,
          onChanged: onChanged,
          showValueLabel: false,
        ),
      ),
    );
  }
}
