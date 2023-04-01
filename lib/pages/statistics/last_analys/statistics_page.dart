import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/common/sleep_analysis/sleep_analysis.dart';
import 'package:splyshechka/pages/statistics/last_analys/bloc/last_statistic_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<LastStatisticBloc>()
          ..add(
            const LastStatisticEvent.started(),
          ),
        child: BlocSideEffectConsumer<LastStatisticBloc, LastStatisticBloc,
            LastStatisticState, LastStatisticCommand>(
          listener: (context, sideEffect) {
            sideEffect.when(
              navToAllAnalyses: () {
                context.navigateTo(const AllAnalysisRoute());
              },
            );
          },
          builder: (context, state) => state.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                )
              : state.sleepFilePath == null
                  ? const _NoData()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: SleepAnalysis(filePath: state.sleepFilePath!),
                      ),
                    ),
        ),
      ),
    );
  }
}

class _NoData extends StatelessWidget {
  const _NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Анализ последнего сна",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamilyOpenSans,
                fontSize: 16.sm,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(180, 180, 185, 1),
                height: 23 / 16.sm,
              ),
            ),
            Text(
              "Нет данных для анализа. Вам следует поспать!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamilyOpenSans,
                fontSize: 16.sm,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(180, 180, 185, 1),
                height: 23 / 16.sm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
