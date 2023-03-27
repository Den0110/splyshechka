import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/pages/statistics/all_analysis/bloc/all_analysis_bloc.dart';
import 'package:splyshechka/pages/statistics/all_analysis/widget/card.dart';


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
        create: (context) => AllAnalysisBloc()..add(PageOpened()),
        child: BlocSideEffectConsumer<AllAnalysisBloc, AllAnalysisBloc,
            AllAnalysisState, AllAnalysisCommand>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 674.h,
                    child: ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (context, index) => AnalysisCard(
                        date: state.model[index].date,
                        awake: state.model[index].awake,
                        goBed: state.model[index].goBed,
                        sleepAll: state.model[index].sleepAll,
                        sleepQuality: state.model[index].sleepQuality,
                        onTap: () {
                          context.read<AllAnalysisBloc>().add(AllAnalysisEvent.onCardClicked(index: index));
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
