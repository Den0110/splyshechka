import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/domain/models/bottom_bars/app_bottom_bar_items.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/main/bloc/main_bloc.dart';
import 'package:splyshechka/widgets/avatar.dart';
import 'package:splyshechka/widgets/bottom_bars/app_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainBloc>()..add(PageOpened()),
      child: BlocSideEffectConsumer<MainBloc, MainBloc, MainState, MainCommand>(
        listener: (context, state) {
          if (state is NavToProfile) {
            context.router.navigate(const ProfileRoute());
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leadingWidth: 46.w,
            leading: GestureDetector(
              onTap: () {
                context.read<MainBloc>().add(const MainEvent.avatarClicked());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state.maybeWhen(
                    orElse: () => SizedBox(),
                    pageOpen: (user) => Avatar(
                      color: user.avatar.color,
                      imageUrl: user.avatar.emojiUrl,
                      size: 28.r,
                      padding: 4.r,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: AutoTabsRouter(
            routes: [HomeRoute(), ArticlesRoute(), StatisticsRoute(), AchievementsRoute()],
            builder: (context, child, animation) {
              return Column(
                children: [
                  Expanded(
                      child: SizedBox(width: double.infinity, child: child)),
                  AppBottomBar(
                    values: AppBottomBarItem.values,
                    selected: AppBottomBarItem
                        .values[AutoTabsRouter.of(context).activeIndex],
                    onSelected: (item) {
                      AutoTabsRouter.of(context).setActiveIndex(
                          AppBottomBarItem.values.indexOf(item));
                    },
                  ),
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
