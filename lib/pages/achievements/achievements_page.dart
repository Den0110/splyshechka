import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/domain/models/achievements/achievement_list.dart';
import 'package:splyshechka/pages/achievements/bloc/achievement_bloc.dart';
import 'package:splyshechka/pages/achievements/widgets/achievemenets_column_widget.dart';
import 'package:splyshechka/pages/achievements/widgets/achievement_card.dart';
import 'package:splyshechka/pages/achievements/widgets/page_indicator.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  late int selectedPage;

  final acquiredAchivements =
      Achievements.achievements.where((element) => element.isAchieved).toList();
  final notAcquiredAchivements = Achievements.achievements
      .where((element) => !element.isAchieved)
      .toList();

  @override
  void initState() {
    selectedPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AchievementBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.space,
        appBar: AppBar(
          toolbarHeight: 10.h,
          title: Container(
            padding: EdgeInsets.only(bottom: 7.h),
            height: 5.h,
            child: PageIndicator(
              index: selectedPage,
              count: 2,
            ),
          ),
        ),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 16.w, left: 16.w, top: 9.h, bottom: 100.h),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "Полученные достижения",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 26.sp,
                        ),
                      ),
                    ),
                    AchievementsColumnWidget(
                      achievements: acquiredAchivements,
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 16.w, left: 16.w, top: 9.h, bottom: 100.h),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "Неполученные достижения",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 26.sp,
                        ),
                      ),
                    ),
                    AchievementsColumnWidget(
                      achievements: notAcquiredAchivements,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// BlocProvider(
//       create: (context) => getIt<AchievementBloc>(),
//       child: BlocSideEffectConsumer<AchievementBloc, AchievementBloc,
//           AchievementState, AchievementCommand>(
//         listener: (context, state) {
//           state.when(
//             openCard: () {},
//           );
//         },
//         builder: (context, state) => state.loading
//             ? const Center(
//                 child: CircularProgressIndicator(
//                   color: AppColors.purple,
//                 ),
//               )
//             :