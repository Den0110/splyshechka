import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';

class AppTextStyles {
  static const fontFamilySFPro = "packages/core_ui/SF-Pro";
  static const fontFamilyOpenSans = "packages/core_ui/OpenSans";
  static const fontFamilyStapel = "packages/core_ui/Stapel";

  static final buttonLargeStyle = TextStyle(
    height: 22.h / 16.h,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    fontFamily: fontFamilySFPro,
  );
  static final buttonSmallStyle = TextStyle(
    height: 22.h / 13.h,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    fontFamily: fontFamilyOpenSans,
  );
  static final actionsBarStyle = TextStyle(
    letterSpacing: -0.408.w,
    color: AppColors.white,
    height: 22.h / 10.sp,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    fontFamily: fontFamilyOpenSans,
  );
  static final sliderStyle = TextStyle(
    fontSize: 9.sp,
    height: 7.h / 9.sp,
    color: AppColors.green,
    fontFamily: fontFamilySFPro,
  );
  static final smallHeaderStyle = TextStyle(
    fontSize: 16.sp,
    height: 22.h / 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final optionStyle = TextStyle(
    fontSize: 12.sp,
    height: 17.h / 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );
  static final containerLabelStyle = TextStyle(
    fontSize: 12.sp,
    height: 16.h / 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilySFPro,
  );
  static final boldOptionStyle = TextStyle(
    fontSize: 12.sp,
    height: 17.h / 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final bodyStyle = TextStyle(
    fontSize: 15.sp,
    height: 22.h / 15.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );
  static final subtitleStyle = TextStyle(
    fontSize: 12.sp,
    height: 15.h / 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilySFPro,
  );
  static final pinStyle = TextStyle(
    fontSize: 28.sp,
    height: 22.h / 28.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontFamily: fontFamilyOpenSans,
  );
  static TextStyle notificationsTitle = const TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static TextStyle notificationsSubTitle = TextStyle(
    color: AppColors.white.withOpacity(0.7),
    height: 18.h / 12.sp,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );
  static TextStyle indicatorStyle = const TextStyle(
    color: AppColors.lightGrey,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilyOpenSans,
  );
  static TextStyle hintStyle = const TextStyle(
    color: AppColors.hintColor,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );
  static TextStyle fillTextFieldStyle = const TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );

  static final titleMediumStyle = TextStyle(
    letterSpacing: 0.38.sp,
    color: AppColors.white,
    height: 24.h / 20.sp,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    fontFamily: fontFamilyStapel,
  );

  static final clockSmallStyle = TextStyle(
    fontSize: 12.sp,
    height: 8.h / 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans-Regular',
  );

  static final clockNumberStyle = TextStyle(
    fontSize: 37.sp,
    height: 29.h / 37.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans-Regular',
  );

  static final clockLetterStyle = TextStyle(
    fontSize: 22.sp,
    height: 18.h / 22.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans-Regular',
  );

  static final lineIndicatorText = TextStyle(
    fontSize: 10.sp,
    height: 9.h / 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final pillowHeadAttributesStyle = TextStyle(
    fontFamily: fontFamilyStapel,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    height: 24.h / 20.sp,
  );
  static final pillowAttribytesStyle = TextStyle(
    fontSize: 10.sp,
    height: 12.h / 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final pillowCode = TextStyle(
    fontSize: 12.sp,
    fontFamily: fontFamilyOpenSans,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );

  static final appBarStyle = TextStyle(
    fontFamily: AppTextStyles.fontFamilyStapel,
    fontSize: 17.sp,
    height: 22.h / 17.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.41.w,
    color: AppColors.white,
  );

  static final appBarBalanceStyle = TextStyle(
    fontFamily: AppTextStyles.fontFamilySFPro,
    fontSize: 13.sp,
    height: 23.h / 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41.w,
    color: AppColors.white,
  );

  static final wheelStyle = TextStyle(
    height: 18.h / 13.sp,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    fontFamily: fontFamilyOpenSans,
  );
  static final counterCoinTextStyle = TextStyle(
      fontFamily: fontFamilyOpenSans,
      fontSize: 17.sp,
      letterSpacing: -0.41.w,
      height: 11.h / 17.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black);

  //SetSleepTimePage
  static final timeSelectionLabelStyle = TextStyle(
    fontSize: 12.sp,
    height: 13.h / 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );

  static final timeSelectionNumberStyle = TextStyle(
    fontSize: 42.sp,
    height: 42.h / 42.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  //AlarmResultPage
  static TextStyle alarmLabelStyle = TextStyle(
    color: AppColors.lightGrey,
    height: 13.h / 13.sp,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle alarmSubtitleStyle = TextStyle(
    color: AppColors.lightGrey,
    height: 13.h / 12.sp,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );

  //GoodMorningPage
  static final alarmTitle = TextStyle(
    fontSize: 28.sp,
    height: 34.h / 28.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyStapel,
  );

  static final alarmSubtitle = TextStyle(
    fontSize: 15.sp,
    height: 18.h / 15.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static final alarmNumber = TextStyle(
    fontSize: 68.sp,
    height: 53.h / 68.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle alarmDurationStyle = TextStyle(
    color: AppColors.white,
    height: 22.h / 28.sp,
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle alarmValueStyle = TextStyle(
    color: AppColors.white,
    height: 22.h / 22.sp,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle alarmBigValueStyle = TextStyle(
    color: AppColors.white,
    height: 29.h / 37.sp,
    fontSize: 37.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static final alarmLetter = TextStyle(
    fontSize: 25.sp,
    height: 20.h / 25.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final alarmPercentStyle = TextStyle(
    color: AppColors.white,
    height: 22.h / 18.sp,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );
  static final bottomLabelStyle = TextStyle(
    fontFamily: AppTextStyles.fontFamilySFPro,
    fontSize: 13.sp,
    height: 18.h / 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.08.w,
    color: AppColors.subtitleColor,
  );

  static TextStyle profileLabelStyle = TextStyle(
    height: 16.h / 14.sp,
    color: AppColors.hintColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    fontFamily: fontFamilySFPro,
  );

  static TextStyle profileNameStyle = TextStyle(
    height: 15.h / 17.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    fontFamily: fontFamilyStapel,
  );

  static TextStyle profileEmailStyle = TextStyle(
    height: 18.h / 13.sp,
    color: AppColors.hintColor,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    fontFamily: fontFamilyOpenSans,
  );
}
