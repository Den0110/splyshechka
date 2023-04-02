import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/models/gender/gender.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_avatar/avatar.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/options_list/value_element.dart';

import 'bloc/profile_settings_bloc.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfileSettingsBloc>()..add(const PageOpened()),
      child: BlocSideEffectConsumer<ProfileSettingsBloc, ProfileSettingsBloc,
          ProfileSettingsState, ProfileSettingsCommand>(
        listener: (context, state) {
          if (state is NavToSettingsAvatar) {
            context.router.navigate(
              const ProfileSettingsAvatarRoute(),
            );
          }
          if (state is NavToSettingsEmail) {
            context.router.navigate(
              const ProfileSettingsEmailRoute(),
            );
          }
          if (state is NavToSettingsName) {
            context.router.navigate(
              const ProfileSettingsNameRoute(),
            );
          }
          if (state is NavToSettingsPassword) {
            context.router.navigate(
               ProfileSettingsPasswordRoute(),
            );
          }
          if (state is NavToSettingsGender) {
            context.router.navigate(
              const ProfileSettingsGenderRoute(),
            );
          }
          if (state is NavToDeleteAccount) {
            context.router.navigate(
              const LoginRoute(),
            );
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(state.user.nickname),
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
                        context.read<ProfileSettingsBloc>().add(
                              const ProfileSettingsEvent.avatarEditPressed(),
                            );
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Avatar(
                            color: state.user.avatar.color,
                            imageUrl: state.user.avatar.emojiUrl,
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
                            value: state.user.email,
                            isActive: true,
                            onTap: () {
                              context.read<ProfileSettingsBloc>().add(
                                    ProfileSettingsEvent.emailEditPressed(),
                                  );
                            },
                          ),
                          ValueElement(
                            title: "Имя",
                            value: state.user.fullName,
                            isActive: true,
                            onTap: () {
                              context.read<ProfileSettingsBloc>().add(
                                    ProfileSettingsEvent.nameEditPressed(),
                                  );
                            },
                          ),
                          ValueElement(
                            title: "Пол",
                            value: state.user.gender.getName,
                            isActive: true,
                            onTap: () {
                              context.read<ProfileSettingsBloc>().add(
                                    ProfileSettingsEvent.genderEditPressed(),
                                  );
                            },
                          ),
                          ValueElement(
                            title: "Пароль",
                            value: "Установлен",
                            isActive: true,
                            onTap: () {
                              context.read<ProfileSettingsBloc>().add(
                                    ProfileSettingsEvent.passwordEditPressed(),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SleepContainer(
                      child: ValueElement(
                        title: "Удалить аккаунт",
                        titleColor: AppColors.red,
                        isActive: true,
                        onTap: () {
                          context.read<ProfileSettingsBloc>().add(
                                ProfileSettingsEvent.deleteAccountPressed(),
                              );
                        },
                      ),
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
