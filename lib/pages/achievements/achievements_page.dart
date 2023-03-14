import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/achievements/achievement_list.dart';
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
    return Scaffold(
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
                  SizedBox(height: 20.h),
                  if (acquiredAchivements.isEmpty)
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
                  for (int i = 0; i < acquiredAchivements.length; i++)
                    AchievementCard(achievement: acquiredAchivements[i])
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
                  SizedBox(height: 20.h),
                  if (notAcquiredAchivements.isEmpty)
                    SizedBox(
                      height: 500.h,
                      child: Center(
                        child: Text(
                          "Вы получили все достижения!",
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontFamily: AppTextStyles.fontFamilyOpenSans,
                            fontSize: 26.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  for (int i = 0; i < notAcquiredAchivements.length; i++)
                    AchievementCard(achievement: notAcquiredAchivements[i])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
