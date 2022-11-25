import 'package:flutter/material.dart';
import 'package:my_pillow/utils/app_colors.dart';

abstract class FillIndicator extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double value;
  final String? text;

  final LinearGradient? gradients;
  final Duration? animationDuration;
  final Duration? animationDelay;
  final Curve? animationCurve;
  final bool animate;

  const FillIndicator({
    required this.minValue,
    required this.maxValue,
    required this.value,
    this.text,
    this.gradients,
    this.animationCurve,
    this.animationDelay,
    this.animationDuration,
    this.animate = true,
    Key? key,
  }) : super(key: key);
}

abstract class FillIndicatorState<T extends FillIndicator> extends State<T>
    with TickerProviderStateMixin {
  static const Duration defaultAnimationDuration = Duration(seconds: 2);
  static const Duration _defaultAnimationDelay = Duration(seconds: 1);
  static const Curve _defaultAnimationCurve = Curves.easeOutQuart;

  Duration get _animationDuration {
    return widget.animationDuration ?? defaultAnimationDuration;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.animate ? _animationDuration : Duration.zero,
    );
    animate(immediately: false);
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  static const LinearGradient defaultGradient = LinearGradient(
    colors: [
      AppColors.peach,
      AppColors.yellow,
      AppColors.lightYellow,
      AppColors.green,
    ],
    stops: [
      0.25,
      0.5,
      0.66,
      0.75,
    ],
  );
  late Animation animationColor;
  late Animation<double> animationPercent;
  AnimationController? controller;

  double? lastValue;
  double? lastPercent;
  Color? lastColor;

  Color? _getColor(double percent, LinearGradient gradient) {
    List<double>? stops = gradient.stops;
    if (stops == null || gradient.colors.length != stops.length) {
      final step = 1.0 / (gradient.colors.length - 1);
      stops = List.generate(gradient.colors.length, (index) => index * step);
    }
    return _lerpGradient(
      gradient.colors,
      stops,
      percent,
    );
  }

  Color? _lerpGradient(List<Color> colors, List<double> stops, double t) {
    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s], rightStop = stops[s + 1];
      final leftColor = colors[s], rightColor = colors[s + 1];
      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT);
      }
    }
    return colors.last;
  }

  double get normalizedValue {
    double min = widget.minValue;
    double max = widget.maxValue;
    double val = widget.value;
    return (val - min) / (max - min);
  }

  void animate({bool immediately = true}) {
    final targetPercent = normalizedValue;
    Tween<double> tweenPercent = Tween<double>(
      begin: lastPercent ?? 0.0,
      end: targetPercent,
    );
    final gradient = widget.gradients ?? defaultGradient;
    final targetColor = _getColor(targetPercent, gradient);
    ColorTween tweenColor = ColorTween(
      begin: lastColor ?? gradient.colors[0],
      end: targetColor,
    );

    animationPercent = tweenPercent.animate(
      CurvedAnimation(
        curve: widget.animationCurve ?? _defaultAnimationCurve,
        parent: controller!,
      ),
    );
    animationColor = tweenColor.animate(
      CurvedAnimation(
        curve: widget.animationCurve ?? _defaultAnimationCurve,
        parent: controller!,
      ),
    );

    animationColor.addListener(() {
      setState(() {});
    });

    if (immediately || !widget.animate) {
      controller?.reset();
      controller?.forward();
    } else {
      Future.delayed(widget.animationDelay ?? _defaultAnimationDelay, () {
        controller?.reset();
        controller?.forward();
      });
    }

    lastPercent = targetPercent;
    lastColor = targetColor;
    lastValue = widget.value;
  }

  buildIndicator(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (lastValue != null && lastValue != widget.value) {
      animate();
    }
    return buildIndicator(context);
  }
}
