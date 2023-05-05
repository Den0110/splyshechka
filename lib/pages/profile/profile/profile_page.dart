import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/domain/models/gender/gender.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_avatar/avatar.dart';
import 'package:splyshechka/pages/profile/profile/bloc/profile_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/options_list/switch_element.dart';
import 'package:splyshechka/widgets/options_list/value_element.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.pageOpened()),
      child: OneShotBlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is NavToProfileSettings) {
            context.router.navigate(
              const ProfileSettingsRoute(),
            );
          }
          if (state is NavToPrivacyPolicy) {}
          if (state is NavToTermsOfUse) {}
          if (state is NavToRecords) {}
          if (state is Logout) {
            context.router.navigate(
              const LoginRoute(),
            );
          }
        },
        builder: (context, state) => state.maybeWhen(
          (user) => Scaffold(
            appBar: AppBar(
              title: const Text("Профиль"),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    context.read<ProfileBloc>().add(
                          const ProfileEvent.settingsPressed(),
                        );
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
                        color: user.avatar.color,
                        imageUrl: user.avatar.emojiUrl,
                        size: 107.r,
                        padding: 15.r,
                      ),
                      SizedBox(height: 16.5.h),
                      Text(
                        user.nickname,
                        style: AppTextStyles.profileNameStyle,
                      ),
                      Text(
                        user.email,
                        style: AppTextStyles.profileEmailStyle,
                      ),
                      SizedBox(height: 35.h),
                      SleepContainer(
                        child: Column(
                          children: [
                            ValueElement(
                              title: "Email",
                              value: user.email,
                              isActive: true,
                            ),
                            ValueElement(
                              title: "Имя",
                              value: user.fullName,
                              isActive: true,
                            ),
                            ValueElement(
                              title: "Пол",
                              value: user.gender.getName,
                              isActive: true,
                            ),
                            ValueElement(
                              title: "Пароль",
                              value: "Установлен",
                              isActive: true,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 35.h),
                      // SleepContainer(
                      //   child: Column(
                      //     children: [
                      //       ValueElement(
                      //         title: "Аудиозаписи",
                      //         isActive: false,
                      //         onTap: () {
                      //           context.read<ProfileBloc>().add(
                      //                 const ProfileEvent.recordsPressed(),
                      //               );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 10.h),
                      // SleepContainer(
                      //   child: Column(
                      //     children: [
                      //       SwitchElement(
                      //         title: "Звук",
                      //         isActive: true,
                      //         value: user.sound,
                      //         onChanged: (sound) {
                      //           context.read<ProfileBloc>().add(
                      //                 ProfileEvent.soundChanged(
                      //                   sound: sound,
                      //                 ),
                      //               );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 10.h),
                      LargeButton(
                        text: "Выйти из аккаунта",
                        textColor: AppColors.red,
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                                const ProfileEvent.logoutPressed(),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          orElse: Container.new,
        ),
      ),
    );
  }
}
