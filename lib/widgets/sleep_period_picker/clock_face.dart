
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/clock_face_painter.dart';

import '../../utils/app_colors.dart';

class ClockFace extends StatelessWidget {
  const ClockFace({super.key, required this.hours});

  final int hours;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 186.r,
          width: 186.r,
          child: CustomPaint(
            painter: ClockFacePainter(),
          ),
        ),
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "$hours",
                style: AppTextStyles.clockNumberStyle
                    .copyWith(color: AppColors.white),
              ),
              TextSpan(
                text: " h",
                style: AppTextStyles.clockLetterStyle
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
