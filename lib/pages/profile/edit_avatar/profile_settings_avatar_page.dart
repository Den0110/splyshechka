import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/models/pickers/face_picker_items.dart';
import 'package:splyshechka/models/pickers/sleep_color_picker_items.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_avatar/avatar.dart';
import 'package:splyshechka/pages/profile/edit_avatar/bloc/profile_settings_avatar_bloc.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/face_picker/face_picker.dart';
import 'package:splyshechka/widgets/sleep_color_picker/sleep_color_picker.dart';

class ProfileSettingsAvatarPage extends StatelessWidget {
  const ProfileSettingsAvatarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsAvatarBloc>(),
      child: OneShotBlocConsumer<ProfileSettingsAvatarBloc, ProfileSettingsAvatarState>(
        listener: (context, state) {
          // if (state is NavToBack) {
          //   context.router.navigate(
          //     const ProfileSettingsRoute(),
          //   );
          // }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(state.user.fullName),
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
                      color: state.user.avatar.color,
                      imageUrl: state.user.avatar.emojiUrl,
                      size: 178.r,
                      padding: 25.r,
                    ),
                    SizedBox(height: 10.h),
                    SleepColorPicker(
                      selectedColor: state.user.avatar.color,
                      values: sleepColorPickerItems,
                      onSelected: (color) {
                        context.read<ProfileSettingsAvatarBloc>().add(
                              ProfileSettingsAvatarEvent.colorChanged(
                                color: color,
                              ),
                            );
                      },
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      child: Text(
                        "Мордашка",
                        style: AppTextStyles.titleMediumStyle,
                      ),
                    ),
                    FacePicker(
                      onTap: (face) {
                        context.read<ProfileSettingsAvatarBloc>().add(
                              ProfileSettingsAvatarEvent.faceChanged(
                                face: face,
                              ),
                            );
                      },
                      selectedImage: state.user.avatar.emojiUrl,
                      values: facePickerItems,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}