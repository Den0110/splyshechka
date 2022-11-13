import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/options_list/active_widget.dart';
import 'package:my_pillow/widgets/switchers/sleep_stepper/small_square_button.dart';

class SleepStepper extends StatelessWidget {
  const SleepStepper({
    super.key,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
    this.isActiveMinus=true,
    this.isActivePlus=true,
    this.incColor = AppColors.green,
    this.decColor = AppColors.mediumGrey,
    this.incIconColor = AppColors.lightGrey,
    this.decIconColor = AppColors.darkGrey,
  });
  final bool isActivePlus;
  final bool isActiveMinus;
  final num value;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final Color incColor;
  final Color decColor;
  final Color incIconColor;
  final Color decIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActiveWidget(
          isActive: isActiveMinus,
          child: SmallSquareButton(
            color: decColor,
            onTap: onDecrease,
            child: Icon(
              Icons.remove,
              size: 22.r,
              color: incIconColor,
            ),
          ),
        ),
        Text(
          value.toStringAsFixed(1),
          style: AppTextStyles.smallHeaderStyle.copyWith(
            color: Colors.white,
          ),
        ),
        ActiveWidget(
          isActive: isActivePlus,
          child: SmallSquareButton(
            color: incColor,
            onTap: onIncrease,
            child: Icon(
              Icons.add,
              size: 22.0.r,
              color: decIconColor,
            ),
          ),
        ),
      ],
    );
  }
}