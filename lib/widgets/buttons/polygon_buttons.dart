

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolygonButton extends StatefulWidget {
  final int polygons;
  final double? rotate;
  final Color? buttonColor;
  final Color? shadowColor;
  final Widget? center;
  final VoidCallback onTap;
  const PolygonButton(
      {Key? key,
      required this.polygons,
      this.rotate,
      this.buttonColor,
      this.shadowColor,
      this.center,
      required this.onTap})
      : super(key: key);

  @override
  State<PolygonButton> createState() => _PolygonButtonState();
}

class _PolygonButtonState extends State<PolygonButton> {
  double get _currentRotate {
    return widget.rotate ?? 0;
  }

  Widget get _currentCenterWidget {
    return widget.center ?? const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Positioned(
            top: 2.h,
            child: Container(
              height: 38.h,
              width: 38.w,
              padding: EdgeInsets.only(bottom: 2.5.h),
              decoration: ShapeDecoration(
                shape: PolygonBorder(
                  sides: widget.polygons,
                  rotate: _currentRotate,
                ),
                color: widget.shadowColor,
              ),
            ),
          ),
          Container(
            height: 38.h,
            width: 38.w,
            decoration: ShapeDecoration(
              shape: PolygonBorder(
                sides: widget.polygons,
                rotate: _currentRotate,
              ),
              color: widget.buttonColor,
            ),
            child: Center(child: _currentCenterWidget),
          ),
        ],
      ),
    );
  }
}
