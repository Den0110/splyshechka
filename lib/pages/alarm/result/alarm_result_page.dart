import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/result/bloc/alarm_result_page_bloc.dart';
import 'package:splyshechka/pages/common/sleep_analysis/sleep_analysis.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';

class AlarmResultPage extends StatelessWidget {
  const AlarmResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AlarmResultPageBloc>()..add(const LoadStarted()),
      child: BlocBuilder<AlarmResultPageBloc, AlarmResultPageState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  state.when(
                    initial: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (filePath) => SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 86.h),
                        child: SleepAnalysis(filePath: filePath),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0.w,
                        right: 16.0.w,
                        bottom: 16.h,
                      ),
                      child: LargeButton(
                        text: "Принять",
                        textColor: AppColors.darkGreen,
                        onPressed: () {
                          context.router.navigate(const GoodMorningRoute());
                        },
                        backgroundColor: AppColors.green,
                        shadowColor: AppColors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
