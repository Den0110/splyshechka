import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_email/bloc/profile_settings_email_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/text_fields/app_text_field.dart';

class ProfileSettingsEmailPage extends StatelessWidget {
  const ProfileSettingsEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsEmailBloc>(),
      child: OneShotBlocConsumer<ProfileSettingsEmailBloc,
          ProfileSettingsEmailState>(
        listener: (context, state) {
          if (state is NavToBack) {
            context.router.navigate(
              const ProfileSettingsRoute(),
            );
          }
        },
        builder: (context, state) => state.maybeWhen(
          (user) => Scaffold(
            appBar: AppBar(
              title: const Text("Email"),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                  bottom: 16.h,
                ),
                child: Column(
                  children: [
                    SleepContainer(
                      child: AppTextField(
                        onChanged: (value) {
                          context.read<ProfileSettingsEmailBloc>().add(
                                ProfileSettingsEmailEvent.emailChanged(
                                  email: value,
                                ),
                              );
                        },
                        value: user.email,
                        hint: "Enter Email",
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LargeButton(
                            text: "Save",
                            onPressed: () {
                              context.read<ProfileSettingsEmailBloc>().add(
                                    const ProfileSettingsEmailEvent
                                        .savePressed(),
                                  );
                            },
                            backgroundColor: AppColors.lightGreen,
                            shadowColor: AppColors.lemon,
                            textColor: AppColors.darkGreen,
                          ),
                          SizedBox(height: 6.h),
                          LargeButton(
                            text: "Cancel",
                            onPressed: () {
                              context.read<ProfileSettingsEmailBloc>().add(
                                    const ProfileSettingsEmailEvent
                                        .cancelPressed(),
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
          orElse: Container.new,
        ),
      ),
    );
  }
}
