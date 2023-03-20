import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/pages/login/widgets/gender_selector_field.dart';
import 'package:splyshechka/pages/login/widgets/login_text_field.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(onPressed: () => context.navigateBack()),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 50.h, left: 35.w, right: 35.w),
          child: Column(children: [
            Text(
              "Регистрация",
              style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontFamily: AppTextStyles.fontFamilyOpenSans),
            ),
            SizedBox(height: 50.h),
            LoginTextField(
              hintText: "Имя",
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            LoginTextField(
              hintText: "Фамилия",
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            LoginTextField(
              hintText: "Логин",
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            LoginTextField(
              hintText: "Почта",
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            LoginTextField(
              hintText: "Пароль",
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            GenderSelectionField(),
            SizedBox(height: 20.h),
            LoginTextField(
              hintText: "Дата рождениия",
              height: 30.h,
            ),
            SizedBox(height: 40.h),
            GestureDetector(
              onTap: () => context.router.navigateBack(),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(83, 83, 177, 1),
                        offset: Offset(0, 2))
                  ],
                  color: AppColors.greyMain,
                ),
                child: Center(
                  child: Text(
                    "Зарегистрироваться",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppTextStyles.fontFamilyOpenSans,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}


