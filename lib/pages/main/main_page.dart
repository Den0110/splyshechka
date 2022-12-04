import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/bottom_bars/app_bottom_bar_items.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/main/bloc/main_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_images.dart';
import 'package:splyshechka/widgets/avatar.dart';
import 'package:splyshechka/widgets/bottom_bars/app_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocConsumer<MainBloc, MainState>(
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
                  Avatar(
                    color: AppColors.darkPurple,
                    imageUrl: AppImages.sleepingFace,
                    size: 28.r,
                    padding: 4.r,
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: AutoTabsRouter(
            routes: [HomeRoute(), ArticlesRoute(), StatisticsRoute()],
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
