import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/gender/gender.dart';
import 'package:splyshechka/pages/profile/edit_gender/gender_picker/gender_picker.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';

class ProfileSettingsGenderPage extends StatefulWidget {
  const ProfileSettingsGenderPage({super.key});

  @override
  State<StatefulWidget> createState() => ProfileSettingsGenderPageState();
}

class ProfileSettingsGenderPageState extends State<ProfileSettingsGenderPage> {
  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Гендер"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            bottom: 16.h,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GenderPicker(
                  pickedValue: gender,
                  values: Gender.values,
                  onPressed: (val) {
                    setState(() {
                      gender = val;
                    });
                  },
                ),
                const Spacer(),
                LargeButton(
                  text: "Принять",
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
