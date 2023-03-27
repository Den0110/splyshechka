import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class GenderSelectionField extends StatefulWidget {
  const GenderSelectionField({Key? key}) : super(key: key);

  @override
  _GenderSelectionFieldState createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      width: double.maxFinite,
      height: 30.h,
      child: DropdownButton<String>(
          hint: Text("Пол"),
          iconSize: 0.0,
          value: _selectedGender,
          underline: const SizedBox(),
          style: TextStyle(
              color: AppColors.space,
              fontFamily: AppTextStyles.fontFamilyOpenSans,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
          items: <String>["Мужской", "Женский"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                  height: 30.h,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: AppColors.space,
                        fontFamily: AppTextStyles.fontFamilyOpenSans,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  )),
            );
          }).toList()),
    );
  }
}
