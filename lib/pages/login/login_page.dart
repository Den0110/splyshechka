import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/login/widgets/login_text_field.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 100.h, left: 50.w, right: 50.w),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, -0.1),
                  colors: [
                Color.fromRGBO(83, 83, 177, 1),
                AppColors.space,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/images/LarkAndOwl.png",
                  fit: BoxFit.contain,
                  width: 200.w,
                  height: 200.h,
                ),
              ),
              Text(
                "Авторизация",
                style: TextStyle(
                    fontSize: 26.sp,
                    color: Colors.white,
                    fontFamily: AppTextStyles.fontFamilyOpenSans),
              ),
              SizedBox(
                height: 40.h,
              ),
              LoginTextField(hintText: 'Email/логин',height: 30.h,),
              SizedBox(
                height: 15.h,
              ),
              LoginTextField(hintText: "Пароль",height: 30.h,),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                child: Text(
                  "Забыли пароль?",
                  style: TextStyle(
                      color: Color.fromRGBO(141, 141, 255, 1),
                      fontFamily: AppTextStyles.fontFamilyOpenSans,
                      fontSize: 14.sp),
                ),
                onTap: () => context.navigateTo(PasswordRetrievalRoute()),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () => context.navigateBack(),
                child: Container(
                  width: 170.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: AppColors.greyMain,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(83, 83, 177, 1),
                    offset: Offset(0, 1)
                  )
                ],
                  ),
                  child: Center(
                    child: Text(
                      "Войти",
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Еще нет аккаунта?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    GestureDetector(
                      child: Text(
                        "Создать.",
                        style: TextStyle(
                            color: Color.fromRGBO(141, 141, 255, 1),
                            fontFamily: AppTextStyles.fontFamilyOpenSans,
                            fontSize: 14.sp),
                      ),
                      onTap: () => context.navigateTo(RegistrationRoute()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
