
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:intl/intl.dart';

class SleepTimePicker extends StatefulWidget {
  final int? initialHour;
  final int? initialMin;
  final int minutesInterval;
  final TextStyle? highlightedTextStyle;
  final TextStyle? normalTextStyle;
  final Function(int, int) onTimeChanged;
  final Color? centerBoxColor;

  const SleepTimePicker({
    Key? key,
    required this.onTimeChanged,
    this.initialHour = 0,
    this.initialMin = 0,
    this.minutesInterval = 1,
    this.highlightedTextStyle,
    this.normalTextStyle,
    this.centerBoxColor,
  }) : super(key: key);

  @override
  SleepTimePickerState createState() => SleepTimePickerState();
}

class SleepTimePickerState extends State<SleepTimePicker> {
  static final _defaultHighlightTextStyle = TextStyle(
    fontSize: 65.sp,
    color: AppColors.white,
    height: 56.h / 65.sp,
    fontFamily: AppTextStyles.fontFamilyOpenSans,
    fontWeight: FontWeight.w400,
  );
  static final _defaultNormalTextStyle = TextStyle(
    fontSize: 65.sp,
    fontFamily: AppTextStyles.fontFamilyOpenSans,
    fontWeight: FontWeight.w400,
    color: AppColors.white.withOpacity(0.3),
    height: 56.h / 65.sp,
  );
  static final _defaultItemHeight = 76.h;
  static final _defaultItemWidth = 107.w;
  static final _defaultSpacingWidth = 37.w;
  static const _defaultVisibleItems = 3;
  static const _defaultDiameterRatio = 5.0;
  static final _defaultBoxColor = AppColors.white.withOpacity(0.1);
  static const _defaultAnimationCurve = Curves.easeOutQuart;
  static const _defaultAnimationDuration = Duration(milliseconds: 500);
  static final _numFormatter = NumberFormat('00');

  late int _selectedHourIndex = _getHourIndex(widget.initialHour);
  late int _selectedMinuteIndex = _getMinIndex(widget.initialMin);

  late final _hourController =
      FixedExtentScrollController(initialItem: _selectedHourIndex);
  late final _minuteController =
      FixedExtentScrollController(initialItem: _selectedMinuteIndex);

  TextStyle get _highlightedTextStyle {
    return widget.highlightedTextStyle ?? _defaultHighlightTextStyle;
  }

  TextStyle get _normalTextStyle {
    return widget.normalTextStyle ?? _defaultNormalTextStyle;
  }

  int get _hourCount => 24;

  int get _minuteCount => (60 / widget.minutesInterval).floor();

  bool isLoop(int value) {
    return value > 10;
  }

  TextStyle _getValueTextStyle(bool isSelected) {
    return isSelected ? _highlightedTextStyle : _normalTextStyle;
  }

  int _getHourIndex(int? hour) => hour ?? 0;

  int _getMinIndex(int? min) => ((min ?? 0) / widget.minutesInterval).floor();

  @override
  void didUpdateWidget(SleepTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_getHourIndex(widget.initialHour) != _selectedHourIndex ||
        _getMinIndex(widget.initialMin) != _selectedMinuteIndex) {
      Future.delayed(Duration.zero, () {
        _hourController.animateToItem(
          _getHourIndex(widget.initialHour),
          curve: _defaultAnimationCurve,
          duration: _defaultAnimationDuration,
        );
        _minuteController.animateToItem(
          _getMinIndex(widget.initialMin),
          curve: _defaultAnimationCurve,
          duration: _defaultAnimationDuration,
        );
      });
    }
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {
      _selectedHourIndex = _hourController.selectedItem % _hourCount;
      _selectedMinuteIndex = _minuteController.selectedItem % _minuteCount;
      widget.onTimeChanged(
        _selectedHourIndex,
        _selectedMinuteIndex * widget.minutesInterval,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultItemHeight * _defaultVisibleItems,
      child: IntrinsicWidth(
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Container(
                  height: _defaultItemHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: widget.centerBoxColor ?? _defaultBoxColor,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: _defaultItemWidth,
                  child: ListWheelScrollView.useDelegate(
                    controller: _hourController,
                    onSelectedItemChanged: (_) => _onChanged(),
                    diameterRatio: _defaultDiameterRatio,
                    itemExtent: _defaultItemHeight,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, i) => Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Center(
                          child: Text(
                            _numFormatter.format(i % _hourCount),
                            style: _getValueTextStyle(
                              i % _hourCount == _selectedHourIndex,
                            ),
                          ),
                        ),
                      ),
                    ),
                    physics: const FixedExtentScrollPhysics(),
                  ),
                ),
                Container(
                  width: _defaultSpacingWidth,
                  padding: EdgeInsets.only(bottom: 13.h),
                  child: Center(
                    child: Text(
                      ':',
                      style: _highlightedTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: _defaultItemWidth,
                  child: ListWheelScrollView.useDelegate(
                    controller: _minuteController,
                    onSelectedItemChanged: (_) => _onChanged(),
                    diameterRatio: _defaultDiameterRatio,
                    itemExtent: _defaultItemHeight,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, i) => Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Center(
                          child: Text(
                            _numFormatter.format(
                              i % _minuteCount * widget.minutesInterval,
                            ),
                            style: _getValueTextStyle(
                              i % _minuteCount == _selectedMinuteIndex,
                            ),
                          ),
                        ),
                      ),
                    ),
                    physics: const FixedExtentScrollPhysics(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
