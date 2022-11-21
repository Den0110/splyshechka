
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/widgets/sleep_period_picker/clock_face.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepPeriodPicker extends StatelessWidget {
  const SleepPeriodPicker({
    super.key,
    required this.begin,
    required this.end,
    required this.onSelectionChange,
    this.onSelectionEnd,
  });

  final PickedTime begin;
  final PickedTime end;
  final void Function(PickedTime, PickedTime, bool?) onSelectionChange;
  final void Function(PickedTime, PickedTime, bool?)? onSelectionEnd;

  num hours() {
    var diff = (end.h * 60 + end.m - begin.h * 60 - begin.m) / 60;
    return diff >= 0 ? diff : 24 + diff;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TimePicker(
          height: 300.r,
          width: 300.r,
          initTime: begin,
          endTime: end,
          onSelectionChange: onSelectionChange,
          onSelectionEnd:
              onSelectionEnd ?? (PickedTime p1, PickedTime p2, bool? f) {},
          decoration: TimePickerDecoration(
            initHandlerDecoration: TimePickerHandlerDecoration(
              color: AppColors.black,
              radius: 12.r,
              icon: Icon(
                Icons.bedtime,
                color: AppColors.white,
                size: 15.r,
              ),
            ),
            endHandlerDecoration: TimePickerHandlerDecoration(
              color: AppColors.black,
              radius: 12.r,
              icon: Icon(
                Icons.notifications_active,
                color: AppColors.white,
                size: 15.r,
              ),
            ),
            sweepDecoration: TimePickerSweepDecoration(
                pickerStrokeWidth: 36.r, pickerColor: AppColors.yellow),
            baseColor: AppColors.mediumGrey,
          ),
          child: Center(
            child: ClockFace(
              hours: hours().toInt(),
            ),
          ),
        ),
      ],
    );
  }
}
/*
Center(
        child: Text(
          ("${begin.h} ${begin.m}  ${end.h} ${end.m}"),
        ),
      )
 */
