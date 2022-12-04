import 'package:auto_route/auto_route.dart';
import 'package:splyshechka/domain/entities/alarm/snooze_time.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/sleep_wheel_picker/sleep_wheel_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/pages/alarm/snooze/bloc/snooze_page_bloc.dart';

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
                    "Отложить",
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
                  text: "Сохранить",
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
                  text: "Отмена",
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
