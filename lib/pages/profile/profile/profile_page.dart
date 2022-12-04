import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_avatar/avatar.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_images.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/options_list/switch_element.dart';
import 'package:splyshechka/widgets/options_list/value_element.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool sound = true;
  bool googleAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              context.router.navigate(const ProfileSettingsRoute());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Avatar(
                  color: AppColors.darkPurple,
                  imageUrl: AppImages.sleepingFace,
                  size: 107.r,
                  padding: 15.r,
                ),
                SizedBox(height: 16.5.h),
                Text(
                  "Иван Подушечкин",
                  style: AppTextStyles.profileNameStyle,
                ),
                Text(
                  "lublu_spat@mail.ru",
                  style: AppTextStyles.profileEmailStyle,
                ),
                SizedBox(height: 35.h),
                SleepContainer(
                  child: Column(
                    children: [
                      ValueElement(
                        title: "Records",
                        isActive: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SleepContainer(
                  child: Column(
                    children: [
                      SwitchElement(
                        title: "Sound",
                        isActive: true,
                        value: sound,
                        onChanged: (val) {
                          setState(() {
                            sound = val;
                          });
                        },
                      ),
                      SwitchElement(
                        title: "Google Authenticator",
                        isActive: false,
                        value: googleAuth,
                        onChanged: (val) {
                           setState(() {
                            googleAuth = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                LargeButton(
                  text: "Logout",
                  textColor: AppColors.red,
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
