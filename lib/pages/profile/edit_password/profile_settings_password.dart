import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_password/bloc/profile_settings_password_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/validation.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/buttons/small_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/text_fields/app_text_field.dart';

class ProfileSettingsPasswordPage extends StatelessWidget {
  const ProfileSettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsPasswordBloc>(),
      child: BlocSideEffectConsumer<
          ProfileSettingsPasswordBloc,
          ProfileSettingsPasswordBloc,
          ProfileSettingsPasswordState,
          ProfileSettingsPasswordCommand>(
        listener: (context, sideEffect) {
          if (sideEffect is NavToBack) {
            const snackBar = SnackBar(
              content: Text('Пароль успешно изменён!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            context.router.navigate(
              const ProfileSettingsRoute(),
            );
          }
          if (sideEffect is Error) {
            const snackBar = SnackBar(
              content: Text('Ошибка! Неверный данные.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Пароль"),
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
                    if (state.state == PasswordState.codeSent) ...[
                      SleepContainer(
                        child: AppTextField(
                          onlyNumbers: true,
                          value: state.code,
                          onChanged: (value) {
                            context.read<ProfileSettingsPasswordBloc>().add(
                                  ProfileSettingsPasswordEvent.emailCodeChanged(
                                      code: value),
                                );
                          },
                          hint: "Введите код отправленный на Email",
                          onDelete: () {
                            context.read<ProfileSettingsPasswordBloc>().add(
                                  const ProfileSettingsPasswordEvent
                                      .deleteCode(),
                                );
                          },
                        ),
                      ),
                      state.wrongCode != null
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                left: 16.w,
                              ),
                              child: Text(
                                state.wrongCode!,
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontFamily: AppTextStyles.fontFamilyOpenSans,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15.h,
                        top: 5.h,
                      ),
                      child: SmallButton(
                        text: state.state == PasswordState.initial
                            ? "Отправить код"
                            : "Отправить eще раз",
                        textColor: AppColors.lightGreen,
                        textSize: 16.sp,
                        onPressed: () {
                          context.read<ProfileSettingsPasswordBloc>().add(
                                const ProfileSettingsPasswordEvent
                                    .sendCodePressed(),
                              );
                        },
                      ),
                    ),
                    SleepContainer(
                      child: AppTextField(
                        value: state.password,
                        onChanged: (value) {
                          context.read<ProfileSettingsPasswordBloc>().add(
                                ProfileSettingsPasswordEvent.passwordChanged(
                                    password: value),
                              );
                        },
                        hint: "Новый пароль",
                        onDelete: () {
                          context.read<ProfileSettingsPasswordBloc>().add(
                                const ProfileSettingsPasswordEvent
                                    .deletePassword(),
                              );
                        },
                      ),
                    ),
                    state.wrongPassword != null
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                              left: 16.w,
                            ),
                            child: Text(
                              state.wrongPassword!,
                              style: TextStyle(
                                color: AppColors.red,
                                fontFamily: AppTextStyles.fontFamilyOpenSans,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        children: [
                          LargeButton(
                            text: "Сохранить",
                            onPressed: () {
                              context.read<ProfileSettingsPasswordBloc>().add(
                                    ProfileSettingsPasswordEvent.savePressed(
                                        code: state.code,
                                        password: state.password),
                                  );
                            },
                            backgroundColor: AppColors.lightGreen,
                            shadowColor: AppColors.lemon,
                            textColor: AppColors.darkGreen,
                          ),
                          SizedBox(height: 6.h),
                          LargeButton(
                            text: "Отменить",
                            onPressed: () {
                              context.router.navigate(
                                const ProfileSettingsRoute(),
                              );
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
        },
      ),
    );
  }
}
