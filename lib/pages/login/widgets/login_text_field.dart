import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class RegistrationTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const RegistrationTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: TextInputAction.next,
      cursorWidth: 1.w,
      cursorColor: Color.fromRGBO(141, 141, 255, 1),
      style: TextStyle(
          color: AppColors.space,
          fontFamily: AppTextStyles.fontFamilyOpenSans,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        errorMaxLines: 2,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Color.fromRGBO(112, 109, 109, 1),
            fontFamily: AppTextStyles.fontFamilyOpenSans,
            fontSize: 14.sp),
      ),
    );
  }
}
