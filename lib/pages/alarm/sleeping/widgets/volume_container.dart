import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class VolumeContainer extends StatelessWidget {
  final int volume;

  const VolumeContainer({
    super.key,
    required this.volume,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: 61.w,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 3.w,
              right: 4.w,
              top: 3.5.w,
              bottom: 3.5.w,
            ),
            child: SvgPicture.asset(
              AppIcons.okCircle,
              width: 17.r,
            ),
          ),
          Text(
            "$volume dB",
            style: TextStyle(
              height: 22.h / 13.h,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              fontFamily: AppTextStyles.fontFamilyOpenSans,
              color: AppColors.semiLightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
