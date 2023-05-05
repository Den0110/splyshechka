import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_name/bloc/profile_settings_name_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/containers/sleep_container.dart';
import 'package:splyshechka/widgets/text_fields/app_text_field.dart';

class ProfileSettingsNamePage extends StatelessWidget {
  const ProfileSettingsNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsNameBloc>(),
      child: BlocSideEffectConsumer<
          ProfileSettingsNameBloc,
          ProfileSettingsNameBloc,
          ProfileSettingsNameState,
          ProfileSettingsNameCommand>(
        listener: (context, state) {
          if (state is NavToBack) {
            context.router.navigate(
              const ProfileSettingsRoute(),
            );
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("Имя"),
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
                  SleepContainer(
                    child: AppTextField(
                      onChanged: (value) {
                        context.read<ProfileSettingsNameBloc>().add(
                              ProfileSettingsNameEvent.nameChanged(name: value),
                            );
                      },
                      value: state.user.fullName,
                      hint: "Введите имя",
                      onDelete: () {
                        context.read<ProfileSettingsNameBloc>().add(
                              const ProfileSettingsNameEvent.delete(),
                            );
                      },
                    ),
                  ),
                  state.error != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            left: 16.w,
                          ),
                          child: Text(
                            state.error!,
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
                            context.read<ProfileSettingsNameBloc>().add(
                                  const ProfileSettingsNameEvent.savePressed(),
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
                            context.read<ProfileSettingsNameBloc>().add(
                                  const ProfileSettingsNameEvent
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
      ),
    );
  }
}
