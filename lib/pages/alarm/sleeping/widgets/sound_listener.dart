import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/pages/alarm/sleeping/utils/wave_painter.dart';

class SoundListener extends StatefulWidget {
  const SoundListener({
    super.key,
    required this.waveHeight,
  });

  final double waveHeight;

  @override
  State<SoundListener> createState() => _SoundListenerState();
}

class _SoundListenerState extends State<SoundListener>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Tween<double> waveHeightTween;

  @override
  void dispose()
  {
     controller.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    waveHeightTween = Tween(
      begin: -widget.waveHeight,
      end: widget.waveHeight,
    );

    animation = waveHeightTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward(
            from: controller.value,
          );
        }
      });

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant SoundListener oldWidget) {
    double oldWave = waveHeightTween.end!;
    double newWave = widget.waveHeight;
    controller.value =
        ((newWave - oldWave * (1 - controller.value * 2)) / newWave) / 2;
    waveHeightTween.begin = -newWave;
    waveHeightTween.end = newWave;

    controller.status == AnimationStatus.forward
        ? controller.forward()
        : controller.reverse();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter(
        waveHeight: animation.value,
      ),
      child: SizedBox(
        height: 100.h,
        width: 1.sw,
      ),
    );
  }
}
