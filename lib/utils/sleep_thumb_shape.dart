import 'package:flutter/material.dart';
import 'package:my_pillow/utils/app_text_styles.dart';

class SleepThumbShape extends SliderComponentShape {
  SleepThumbShape({
    this.radius = 12.5,
    required this.val,
    required this.showValueLabel,
  });

  final double val;
  final double radius;
  final bool showValueLabel;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    Offset shadowOffset = Offset(center.dx - 2, center.dy);

    canvas.drawCircle(
      shadowOffset,
      radius,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = Colors.white,
    );

    if (showValueLabel) {
      var label = val.toStringAsFixed(2);
      TextPainter tp = TextPainter(
        text: TextSpan(text: label, style: AppTextStyles.sliderStyle),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
        canvas,
        Offset(center.dx - tp.width / 2, center.dy - 2 * radius),
      );
    }
  }
}
