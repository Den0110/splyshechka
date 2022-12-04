import 'package:splyshechka/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double waveHeight;

  WavePainter({
    required this.waveHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double height = size.height;
    double width = size.width;
    final path = Path()..fillType = PathFillType.evenOdd;

    canvas.translate(0, height / 2);

    path.cubicTo(
      width / 2,
      height / 2 * waveHeight,
      width / 2,
      -height / 2 * waveHeight,
      width,
      0,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
