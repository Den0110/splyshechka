import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const PasswordTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscured = true;

  void _toggle() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      cursorWidth: 1.w,
      cursorColor: Color.fromRGBO(141, 141, 255, 1),
      style: TextStyle(
          color: AppColors.space,
          fontFamily: AppTextStyles.fontFamilyOpenSans,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
      obscureText: _obscured,
      decoration: InputDecoration(
        suffixIcon: SizedBox(
          width: 32.sp,
          child: GestureDetector(
            onTap: _toggle,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 16.sp,
            ),
          ),
        ),
        isDense: true,
        suffixIconConstraints: BoxConstraints(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Color.fromRGBO(112, 109, 109, 1),
            fontFamily: AppTextStyles.fontFamilyOpenSans,
            fontSize: 14.sp),
      ),
    );
  }
}
