import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class ClockFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final primaryPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    final secondaryPaint = Paint()
      ..color = AppColors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    final radius = size.width / 2.0;
    Path primaryDash = Path()
      ..moveTo(
        -1.25.w,
        -radius + 6.h,
      )
      ..lineTo(-1.5.w, -radius)
      ..lineTo(1.5.w, -radius)
      ..lineTo(1.25.w, -radius + 6.h);

    Rect secondaryDash = Rect.fromPoints(
        Offset(
          -1.w,
          -radius + 5.h,
        ),
        Offset(1.w, -radius));

    canvas.translate(radius, radius);
    const angle15 = 2.0 * pi / 24.0;
    for (int i = 0; i < 12; i++) {
      canvas.drawPath(primaryDash, primaryPaint);
      canvas.rotate(angle15);
      canvas.drawRect(secondaryDash, secondaryPaint);
      canvas.rotate(angle15);
    }

    TextPainter tp = TextPainter(
      text: TextSpan(text: "0", style: AppTextStyles.clockSmallStyle),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(-tp.width / 2.0, -radius + 12.h),
    );

    tp = TextPainter(
      text: TextSpan(text: "6", style: AppTextStyles.clockSmallStyle),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(radius - 12.w - tp.width, -tp.height / 3.0),
    );

    tp = TextPainter(
      text: TextSpan(text: "12", style: AppTextStyles.clockSmallStyle),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(-tp.width / 2.0, radius - 12.h - tp.height),
    );

    tp = TextPainter(
      text: TextSpan(text: "18", style: AppTextStyles.clockSmallStyle),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(-radius + 12.w, -tp.height / 3.0),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
