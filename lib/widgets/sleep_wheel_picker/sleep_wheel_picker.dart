
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class SleepWheelPicker<T> extends StatefulWidget {
  const SleepWheelPicker({
    super.key,
    required this.onChanged,
    required this.values,
    required this.current,
    this.infinite = false,
  });

  final void Function(int) onChanged;
  final List<T> values;
  final int current;
  final bool infinite;

  @override
  State<SleepWheelPicker<T>> createState() => _SleepWheelPickerState<T>();
}

class _SleepWheelPickerState<T> extends State<SleepWheelPicker<T>> {
  late final FixedExtentScrollController _controller;

  static final _defaultItemHeight = 27.h;

  @override
  void initState() {
    _controller = FixedExtentScrollController(initialItem: widget.current);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: _defaultItemHeight * widget.values.length,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: _defaultItemHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0.r),
                  color: AppColors.darkGrey.withOpacity(0.5),
                ),
              ),
            ),
            ListWheelScrollView.useDelegate(
              controller: _controller,
              onSelectedItemChanged: widget.onChanged,
              diameterRatio: 5,
              itemExtent: _defaultItemHeight,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, i) => Center(
                  child: Text(
                    widget.values[i % widget.values.length].toString(),
                    style: AppTextStyles.wheelStyle.copyWith(
                      color: AppColors.lightGrey
                          .withOpacity((i - widget.current).abs() > 1 ? 0.3 : 0.6),
                    ),
                  ),
                ),
                childCount: widget.infinite ? null : widget.values.length,
              ),
              physics: const FixedExtentScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
