import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';

class PartFillIndicator extends StatefulWidget {
  final int activeParts;
  final int parts;
  final double? width;
  final double? height;
  final double? radius;
  final Color? activeColor;
  final Color? unactiveColor;
  final String? text;
  final Color? textColor;
  const PartFillIndicator({
    Key? key,
    required this.parts,
    required this.activeParts,
    this.activeColor = AppColors.green,
    this.height,
    this.radius,
    this.text,
    this.unactiveColor = AppColors.mediumGrey,
    this.width,
    this.textColor = AppColors.white,
  }) : super(key: key);

  @override
  State<PartFillIndicator> createState() => _PartFillIndicatorState();
}

class _PartFillIndicatorState extends State<PartFillIndicator> {
  List<Widget> containers = [];
  final double _defaultHeight = 17.h;

  double get _currentHeight {
    return widget.height ?? _defaultHeight;
  }

  double get _currentRadius {
    return widget.radius ?? _currentHeight / 2;
  }

  List<Color> _activeColor(List<Color> colors, int countActive) {
    for (int i = 0; i < countActive; i++) {
      colors[i] = widget.activeColor!;
    }
    return colors;
  }

  List<Widget> _widgets(List<Color> colors, int lenght) {
    containers.clear();
    for (int i = 0; i < lenght; i++) {
      if (i == 0) {
        containers.add(
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 1.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_currentRadius),
                    bottomLeft: Radius.circular(_currentRadius),
                  ),
                  color: colors[i],
                ),
              ),
            ),
          ),
        );
      } else if (i == lenght - 1) {
        containers.add(
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 1.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(_currentRadius),
                    bottomRight: Radius.circular(_currentRadius),
                  ),
                  color: colors[i],
                ),
              ),
            ),
          ),
        );
      } else {
        containers.add(
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 1.w),
              child: Container(
                color: colors[i],
              ),
            ),
          ),
        );
      }
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> unactiveColors = List<Color>.generate(widget.parts, (index) {
      return widget.unactiveColor!;
    });
    return SizedBox(
      height: _currentHeight,
      width: double.infinity,
      child: Stack(children: [
        Row(
          children: _widgets(
              _activeColor(unactiveColors, widget.activeParts), widget.parts),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: widget.text != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Text(
                        widget.text!,
                        style: AppTextStyles.lineIndicatorText
                            .copyWith(color: widget.textColor),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ]),
    );
  }
}
