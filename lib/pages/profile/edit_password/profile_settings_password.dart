import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/buttons/small_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/text_fields/app_text_field.dart';

class ProfileSettingsPasswordPage extends StatelessWidget {
  const ProfileSettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пароль"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            bottom: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 6.h,
                  bottom: 8.h,
                ),
                child: Text(
                  "Электронная почта",
                  style: AppTextStyles.profileLabelStyle,
                ),
              ),
              SleepContainer(
                child: AppTextField(
                  onChanged: (value) {},
                  value: "lublu_spat@mail.ru",
                  hint: "Введите электронную почту",
                ),
              ),
              SizedBox(height: 10.h),
              SleepContainer(
                child: AppTextField(
                  onChanged: (value) {},
                  hint: "Введите отправленный код",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 15.h,
                  top: 5.h,
                ),
                child: SmallButton(
                  text: "Отправить код",
                  textColor: AppColors.lightGreen,
                  textSize: 16.sp,
                  onPressed: () {},
                ),
              ),
              SleepContainer(
                child: AppTextField(
                  onChanged: (value) {},
                  hint: "Новый пароль",
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  children: [
                    LargeButton(
                      text: "Сохранить",
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                      backgroundColor: AppColors.lightGreen,
                      shadowColor: AppColors.lemon,
                      textColor: AppColors.darkGreen,
                    ),
                    SizedBox(height: 6.h),
                    LargeButton(
                      text: "Отмена",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
