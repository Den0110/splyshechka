import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/models/gender/gender.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/profile/edit_gender/bloc/profile_settings_gender_bloc.dart';
import 'package:splyshechka/pages/profile/edit_gender/widgets/gender_picker.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';

class ProfileSettingsGenderPage extends StatelessWidget {
  const ProfileSettingsGenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileSettingsGenderBloc>(),
      child: OneShotBlocConsumer<ProfileSettingsGenderBloc,
          ProfileSettingsGenderState>(
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
              title: const Text("Gender"),
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                  bottom: 16.h,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GenderPicker(
                        pickedValue: user.gender,
                        values: Gender.values,
                        onPressed: (gender) {
                          context.read<ProfileSettingsGenderBloc>().add(
                                ProfileSettingsGenderEvent.genderChanged(
                                  gender: gender,
                                ),
                              );
                        },
                      ),
                      const Spacer(),
                      LargeButton(
                        text: "Confirm",
                        onPressed: () {
                          context.read<ProfileSettingsGenderBloc>().add(
                                const ProfileSettingsGenderEvent.savePressed(),
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
                          context.read<ProfileSettingsGenderBloc>().add(
                                const ProfileSettingsGenderEvent
                                    .cancelPressed(),
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
