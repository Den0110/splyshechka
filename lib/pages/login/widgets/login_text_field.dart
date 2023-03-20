
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final double height;
  const LoginTextField({super.key, required this.hintText, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: height,
                child: TextField(
                  
                  textInputAction: TextInputAction.next,
                  cursorWidth: 1.w,
                  cursorColor: Color.fromRGBO(141, 141, 255, 1),
                  style: TextStyle(
                      color: AppColors.space,
                      fontFamily: AppTextStyles.fontFamilyOpenSans,
                      fontSize: 14.sp,fontWeight: FontWeight.w500),
                  decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(112, 109, 109, 1),
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 14.sp)),
                ),
              );
  }
}