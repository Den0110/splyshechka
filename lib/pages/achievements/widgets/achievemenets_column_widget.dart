import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/domain/models/achievements/achievement.dart';
import 'package:splyshechka/pages/achievements/bloc/achievement_bloc.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

import 'achievement_card.dart';

class AchievementsColumnWidget extends StatelessWidget {
  final List<Achievement> achievements;
  const AchievementsColumnWidget({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectConsumer<AchievementBloc, AchievementBloc,
        AchievementState, AchievementCommand>(
      bloc: getIt<AchievementBloc>(),
      listener: (context, state) {
        state.when(
          openCard: () {},
        );
      },
      builder: (context, state) => state.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            )
          : Column(
              children: [
                SizedBox(height: 20.h),
                if (achievements.isEmpty)
                  SizedBox(
                    height: 500.h,
                    child: Center(
                      child: Text(
                        "Вы не получили ни одного достижения",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                for (int i = 0; i < achievements.length; i++)
                  AchievementCard(achievement: achievements[i])
              ],
            ),
    );
  }
}
