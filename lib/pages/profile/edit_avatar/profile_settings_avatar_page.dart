import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/pages/profile/edit_avatar/avatar.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_images.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/face_picker/face_picker.dart';
import 'package:splyshechka/widgets/sleep_color_picker/sleep_color_picker.dart';

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
  AppImages.starFace,
  AppImages.moneyFace,
  AppImages.shushingFace,
  AppImages.smileyFace,
  AppImages.surprisedFace,
  AppImages.vomitFace,
  AppImages.embrassedFace,
  AppImages.deadFace,
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
