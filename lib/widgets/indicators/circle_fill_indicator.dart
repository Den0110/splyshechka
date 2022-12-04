import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/indicators/fill_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleFillIndicator extends FillIndicator {
  final double? indicatorRadius;
  final double? widthIndicator;
  final double? fontSizeText;
  final double? fontSizeUntil;
  final Color? textColor;
  final String? unit;

  const CircleFillIndicator({
    Key? key,
    required super.minValue,
    required super.maxValue,
    required super.value,
    super.text,
    super.gradients,
    super.animationCurve,
    super.animationDelay,
    super.animationDuration,
    super.animate,
    this.fontSizeText,
    this.indicatorRadius,
    this.widthIndicator,
    this.unit,
    this.fontSizeUntil,
    this.textColor,
  }) : super(key: key);

  @override
  CircleFillIndicatorState<CircleFillIndicator> createState() =>
      CircleFillIndicatorState();
}

class CircleFillIndicatorState<T extends CircleFillIndicator>
    extends FillIndicatorState<T> {
  double defaultIndicatorRadius = 18.r;
  double defaultWidthIndicator = 4.r;
  double defaultFontSize = 15.sp;

  double get _currentIndicatorRadius {
    return widget.indicatorRadius ?? defaultIndicatorRadius;
  }

  double get _currentWidthIndicator {
    return widget.widthIndicator ?? defaultWidthIndicator;
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: _currentIndicatorRadius,
          lineWidth: _currentWidthIndicator,
          percent: widget.animate ? animationPercent.value : normalizedValue,
          backgroundColor: AppColors.mediumGrey,
          progressColor: animationColor.value,
          circularStrokeCap: CircularStrokeCap.round,
          center: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text:
                    widget.text ?? ((normalizedValue * 100).toInt()).toString(),
                style: AppTextStyles.indicatorStyle.copyWith(
                  fontSize: widget.fontSizeText ?? defaultFontSize,
                  color: widget.textColor,
                ),
              ),
              widget.unit != null
                  ? TextSpan(
                      text: " ${widget.unit!}",
                      style: AppTextStyles.indicatorStyle.copyWith(
                        fontSize: widget.fontSizeUntil ?? defaultFontSize,
                        color: widget.textColor,
                      ),
                    )
                  : const TextSpan()
            ]),
          ),
        ),
      ],
    );
  }
}
