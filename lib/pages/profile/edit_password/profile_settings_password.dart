import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_password/bloc/profile_settings_password_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
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
      child: OneShotBlocConsumer<ProfileSettingsPasswordBloc,
          ProfileSettingsPasswordState>(
        listener: (context, state) {
          if (state is NavToBack) {
            const snackBar = SnackBar(
              content: Text('Пароль успешно изменён!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            context.router.navigate(
              const ProfileSettingsRoute(),
            );
          }
          if (state is Error) {
            const snackBar = SnackBar(
              content: Text('Ошибка! Неверный данные.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
              (user, state, code, password) => Scaffold(
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
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.w,
                                top: 6.h,
                                bottom: 8.h,
                              ),
                              child: Text(
                                "Email",
                                style: AppTextStyles.profileLabelStyle,
                              ),
                            ),
                            SleepContainer(
                              child: AppTextField(
                                onChanged: (value) {
                                  context
                                      .read<ProfileSettingsPasswordBloc>()
                                      .add(
                                        const ProfileSettingsPasswordEvent
                                            .emailChanged(),
                                      );
                                },
                                value: user.email,
                                hint: "Введите email",
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (state == PasswordState.codeSent) ...[
                              SleepContainer(
                                child: AppTextField(
                                  value: code,
                                  onChanged: (value) {
                                    context
                                        .read<ProfileSettingsPasswordBloc>()
                                        .add(
                                          ProfileSettingsPasswordEvent
                                              .emailCodeChanged(code: value),
                                        );
                                  },
                                  hint: "Введите код отправленный на Email",
                                ),
                              ),
                            ],
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 15.h,
                                top: 5.h,
                              ),
                              child: SmallButton(
                                text: "Отправить код",
                                textColor: AppColors.lightGreen,
                                textSize: 16.sp,
                                onPressed: () {
                                  context
                                      .read<ProfileSettingsPasswordBloc>()
                                      .add(
                                        const ProfileSettingsPasswordEvent
                                            .sendCodePressed(),
                                      );
                                },
                              ),
                            ),
                            SleepContainer(
                              child: AppTextField(
                                value: password,
                                onChanged: (value) {
                                  context
                                      .read<ProfileSettingsPasswordBloc>()
                                      .add(
                                        ProfileSettingsPasswordEvent
                                            .passwordChanged(password: value),
                                      );
                                },
                                hint: "Новый пароль",
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: Column(
                                children: [
                                  LargeButton(
                                    text: "Сохранить",
                                    onPressed: () {
                                      context
                                          .read<ProfileSettingsPasswordBloc>()
                                          .add(
                                            const ProfileSettingsPasswordEvent
                                                .savePressed(),
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
                  ),
              orElse: Container.new);
        },
      ),
    );
  }
}
