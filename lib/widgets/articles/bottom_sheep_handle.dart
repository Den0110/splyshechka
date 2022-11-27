import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      width: 50.w,
      margin: EdgeInsets.only(top: 9.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
        color: Color(0xffDADEE3),
      ),
    );
  }
}
