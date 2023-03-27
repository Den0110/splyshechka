import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/statistics/all_analysis/bloc/all_analysis_bloc.dart';
import 'package:splyshechka/pages/statistics/all_analysis/widget/card.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/date_formatter.dart';

class AllAnalysisPage extends StatelessWidget {
  const AllAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Вся статистика",
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<AllAnalysisBloc>()..add(const PageOpened()),
        child: BlocSideEffectConsumer<AllAnalysisBloc, AllAnalysisBloc,
            AllAnalysisState, AllAnalysisCommand>(
          listener: (context, state) {
            state.when(
              openCard: (sleep) {
                context.navigateTo(CurrentAnalysRoute(
                  sleep: sleep,
                ));
              },
            );
          },
          builder: (context, state) => state.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                )
              : SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 674.h,
                        child: ListView.builder(
                          itemCount: state.listSleep.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.h,
                            ),
                            child: AnalysisCard(
                              date: state.listSleep[index].went_sleep
                                  .toRusFormat(),
                              awake:
                                  "${state.listSleep[index].waked_up_at.hour}:${state.listSleep[index].waked_up_at.minute}",
                              goBed:
                                  "${state.listSleep[index].went_sleep.hour}:${state.listSleep[index].went_sleep.minute}",
                              sleepAll:
                                  "${state.listSleep[index].slept_during.hour}:${state.listSleep[index].slept_during.minute}",
                              sleepQuality:
                                  state.listSleep[index].quality.toDouble(),
                              onTap: () {
                                context
                                    .read<AllAnalysisBloc>()
                                    .add(AllAnalysisEvent.onCardClicked(
                                      sleep: state.listSleep[index],
                                    ));
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
