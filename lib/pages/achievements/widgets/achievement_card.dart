import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/achievements/achievement.dart';
import 'package:splyshechka/models/achievements/achievement_list.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
  });

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: achievement.isAchieved
            ? Border.all(color: AppColors.green)
            : Border.all(width: 0),
        color: AppColors.darkGrey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            spreadRadius: 0.09,
            blurRadius: 5.0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ExpansionTile(
        iconColor: achievement.isAchieved ? AppColors.green : Colors.white,
        collapsedIconColor:
            achievement.isAchieved ? AppColors.green : Colors.white,
        tilePadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 17.w),
        title: Row(
          children: [
            SizedBox(
                width: 45.sp,
                height: 45.sp,
                child: Image.asset(
                  achievement.isAchieved? achievement.image:Achievements.notAchievedImage,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              achievement.headerText,
              style: TextStyle(
                  color: achievement.isAchieved? AppColors.green: Colors.white,
                  fontSize: 22.sp,
                  fontFamily: AppTextStyles.fontFamilySFPro,
                  ),
            ),
          ],
        ),
        children: [
          Container(
            padding: EdgeInsets.all(15.sp),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(205, 200, 220, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  spreadRadius: 0.09,
                  blurRadius: 5.0,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (achievement.isAchieved)
                  Text(
                    "Достижение получено!",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontFamily: AppTextStyles.fontFamilyOpenSans,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                else
                  Text(
                    "Достижение не получено.",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.grey,
                      fontFamily: AppTextStyles.fontFamilyOpenSans,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  achievement.description,
                  style: TextStyle(
                    color:
                        achievement.isAchieved ? Colors.black : AppColors.grey,
                    fontFamily: AppTextStyles.fontFamilyOpenSans,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
