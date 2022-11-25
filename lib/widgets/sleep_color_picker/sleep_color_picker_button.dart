import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SleepColorPickerButton extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  const SleepColorPickerButton({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h,),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
          child: isSelected
              ? Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.5.w,
                      vertical: 1.5.h,
                    ),
                    child: Container(
                      height: 17.h,
                      width: 17.w,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
        ),
      ),
    );
  }
}
