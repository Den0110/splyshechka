import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/text_fields/app_text_field.dart';

class ProfileSettingsNamePage extends StatelessWidget {
  const ProfileSettingsNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            bottom: 16.h,
          ),
          child: Column(
            children: [
              SleepContainer(
                child: AppTextField(
                  onChanged: (value) {},
                  value: "Иван Подушечкин",
                  hint: "Enter name",
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  children: [
                    LargeButton(
                      text: "Save",
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                      backgroundColor: AppColors.lightGreen,
                      shadowColor: AppColors.lemon,
                      textColor: AppColors.darkGreen,
                    ),
                    SizedBox(height: 6.h),
                    LargeButton(
                      text: "Cancel",
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
