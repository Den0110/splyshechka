import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_pillow/navigation/auto_router.gr.dart';
import 'package:my_pillow/pages/profile/edit_avatar/avatar.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_images.dart';
import 'package:my_pillow/widgets/containers/sleep_container.dart';
import 'package:my_pillow/widgets/options_list/value_element.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Иван Подушечкин"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 31.h),
                GestureDetector(
                  onTap: () {
                    context.router.navigate(const ProfileSettingsAvatarRoute());
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Avatar(
                        color: AppColors.darkPurple,
                        imageUrl: AppImages.sleepingFace,
                        size: 107.r,
                        padding: 15.r,
                      ),
                      Positioned(
                        top: 2.h,
                        right: 4.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppIcons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35.h),
                SleepContainer(
                  child: Column(
                    children: [
                      ValueElement(
                        title: "Email",
                        value: "lublu_spat@mail.ru",
                        isActive: true,
                        onTap: () {
                          context.router
                              .navigate(const ProfileSettingsEmailRoute());
                        },
                      ),
                      ValueElement(
                        title: "Name",
                        value: "Иван Подушечкин",
                        isActive: true,
                        onTap: () {
                          context.router
                              .navigate(const ProfileSettingsNameRoute());
                        },
                      ),
                      ValueElement(
                        title: "Gender",
                        value: "Male",
                        isActive: true,
                        onTap: () {
                          context.router
                              .navigate(const ProfileSettingsGenderRoute());
                        },
                      ),
                      ValueElement(
                        title: "Password",
                        value: "Set",
                        isActive: true,
                        onTap: () {
                          context.router
                              .navigate(const ProfileSettingsPasswordRoute());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SleepContainer(
                  child: ValueElement(
                    title: "Delete account",
                    titleColor: AppColors.red,
                    isActive: true,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
