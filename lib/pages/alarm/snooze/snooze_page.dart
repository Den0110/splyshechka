import 'package:auto_route/auto_route.dart';
import 'package:my_pillow/models/wheel_picker/snooze_time.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/buttons/large_button.dart';
import 'package:my_pillow/widgets/sleep_wheel_picker/sleep_wheel_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/di/locator.dart';
import 'package:my_pillow/pages/alarm/snooze/bloc/snooze_page_bloc.dart';

class SnoozePage extends StatelessWidget {
  const SnoozePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SnoozePageBloc>(),
      child: BlocConsumer<SnoozePageBloc, SnoozePageState>(
        listener: (context, state) {
          if (state is NavBack) {
            context.router.pop();
          }
        },
        builder: (context, state) => state.maybeWhen(
          initial: (selectedIndex) => Padding(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              bottom: 16.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 10.h),
                  child: Text(
                    "Snooze",
                    style: AppTextStyles.appBarStyle,
                  ),
                ),
                BlocBuilder<SnoozePageBloc, SnoozePageState>(
                  builder: (context, state) {
                    return SleepWheelPicker(
                      onChanged: (i) {
                        context.read<SnoozePageBloc>().add(
                              CurrentChanged(current: i),
                            );
                      },
                      values: SnoozeTime.values,
                      current: selectedIndex,
                    );
                  },
                ),
                SizedBox(
                  height: 31.h,
                ),
                LargeButton(
                  text: "Save",
                  backgroundColor: AppColors.green,
                  shadowColor: AppColors.yellow,
                  textColor: AppColors.darkGreen,
                  onPressed: () {
                    context.read<SnoozePageBloc>().add(const SaveClicked());
                  },
                ),
                SizedBox(
                  height: 6.h,
                ),
                LargeButton(
                  text: "Cancel",
                  textColor: AppColors.white,
                  onPressed: () {
                    context.read<SnoozePageBloc>().add(const CancelClicked());
                  },
                ),
              ],
            ),
          ),
          orElse: Container.new,
        ),
      ),
    );
  }
}
