import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/pages/profile/edit_avatar/avatar.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_images.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/face_picker/face_picker.dart';
import 'package:my_pillow/widgets/sleep_color_picker/sleep_color_picker.dart';

class ProfileSettingsAvatarPage extends StatefulWidget {
  const ProfileSettingsAvatarPage({super.key});

  @override
  State<StatefulWidget> createState() => ProfileSettingsAvatarPageState();
}

class ProfileSettingsAvatarPageState extends State<ProfileSettingsAvatarPage> {
  Color color = sleepColorPickerItems[0];
  String face = facePickerItems[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 31.h),
                Avatar(
                  color: color,
                  imageUrl: face,
                  size: 178.r,
                  padding: 25.r,
                ),
                SizedBox(height: 10.h),
                SleepColorPicker(
                  selectedColor: color,
                  values: sleepColorPickerItems,
                  onSelected: (val) {
                    setState(() {
                      color = val;
                    });
                  },
                ),
                SizedBox(height: 25.h),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Face",
                    style: AppTextStyles.titleMediumStyle,
                  ),
                ),
                FacePicker(
                  onTap: (val) {
                    setState(() {
                      face = val;
                    });
                  },
                  selectedImage: face,
                  values: facePickerItems,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> facePickerItems = [
  AppImages.sleepingFace,
  AppImages.clownFace,
  AppImages.sleepingFace,
  AppImages.sleepingFace,
  AppImages.sleepingFace,
  AppImages.sleepingFace,
  AppImages.sleepingFace,
];

List<Color> sleepColorPickerItems = [
  AppColors.darkPurple,
  AppColors.purple,
  AppColors.lightBlue,
  AppColors.mint,
  AppColors.lightGreen,
  AppColors.lemon,
  AppColors.yellow,
];
