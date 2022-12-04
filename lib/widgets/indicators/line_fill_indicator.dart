import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/indicators/fill_indicator.dart';

class LineFillIndicator extends FillIndicator {
  final double? height;
  final Color? backgroundColor;
  final Color? color;
  final Color? textColor;
  final double? indicatorRadius;
  final Size? iconSize;
  final String? svgIconPath;
  final double? iconBorderRadius;
  final Color? backgroundIconColor;
  final Color? iconColor;

  const LineFillIndicator({
    Key? key,
    required super.maxValue,
    required super.minValue,
    required super.value,
    super.gradients,
    super.text,
    super.animate,
    this.height,
    this.textColor = AppColors.black,
    this.backgroundColor = AppColors.mediumGrey,
    this.indicatorRadius,
    this.color,
    this.svgIconPath,
    this.iconSize,
    this.iconBorderRadius,
    this.backgroundIconColor = AppColors.white,
    this.iconColor = AppColors.black,
  }) : super(key: key);

  @override
  LineFillIndicatorState<LineFillIndicator> createState() =>
      LineFillIndicatorState();
}

class LineFillIndicatorState<T extends LineFillIndicator>
    extends FillIndicatorState<T> {
  final double _textPadding = 2.5.w;
  final double _iconPadding = 2.w;
  final double _defaultHeight = 17.h;
  final double _defaultHeightWithIcon = 22.h;
  final Size _defaultIconSize = Size(13.r, 13.r);

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  double get _currentIconBorderRadius {
    return widget.iconBorderRadius ?? 0;
  }

  Size get _currentIconSize {
    return widget.iconSize ?? _defaultIconSize;
  }

  double get _currentHeight {
    if (widget.svgIconPath != null) {
      return widget.height ?? _defaultHeightWithIcon;
    } else {
      return widget.height ?? _defaultHeight;
    }
  }

  bool _shouldShowTextInside(Size txtSize, double activeLineWidth) {
    return widget.text != null && _textPosition(txtSize, activeLineWidth);
  }

  bool _textPosition(Size txtSize, double activeLineWidth) {
    return (txtSize.width +
            _textPadding +
            (widget.svgIconPath != null
                ? _currentIconSize.width + _iconPadding * 2
                : 0) <
        activeLineWidth);
  }

  Widget _iconAndText([Color? textColor]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.svgIconPath != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: _iconPadding),
                child: Container(
                  width: _currentIconSize.width,
                  height: _currentIconSize.height,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_currentIconBorderRadius),
                      color: widget.backgroundIconColor),
                  child: Padding(
                    padding: EdgeInsets.all(2.25.r),
                    child: SvgPicture.asset(
                      widget.svgIconPath!,
                      color: widget.iconColor,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        widget.text != null
            ? Padding(
                padding: EdgeInsets.only(
                  left: _textPadding,
                ),
                child: Text(
                  widget.text!,
                  style: AppTextStyles.lineIndicatorText
                      .copyWith(color: textColor ?? widget.textColor),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  double get _currentIndicatorRadius {
    return widget.indicatorRadius ?? _currentHeight / 2;
  }

  @override
  Widget buildIndicator(BuildContext context) {
    Size txtSize = _textSize(widget.text != null ? widget.text! : '',
        AppTextStyles.lineIndicatorText);

    return SizedBox(
      height: _currentHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: _currentHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_currentIndicatorRadius),
              color: widget.backgroundColor,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(_currentIndicatorRadius),
            child: SizedBox(
              height: _currentHeight,
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double activeLineWidth = constraints.maxWidth *
                      (widget.animate
                          ? animationPercent.value
                          : normalizedValue);
                  return Row(
                    children: [
                      Container(
                        height: _currentHeight,
                        width: activeLineWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              _currentIndicatorRadius,
                            ),
                            color: widget.color ?? animationColor.value),
                        child: Center(
                          child: _shouldShowTextInside(txtSize, activeLineWidth)
                              ? _iconAndText()
                              : const SizedBox(),
                        ),
                      ),
                      _shouldShowTextInside(txtSize, activeLineWidth)
                          ? const SizedBox()
                          : _iconAndText(widget.color ?? animationColor.value),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
