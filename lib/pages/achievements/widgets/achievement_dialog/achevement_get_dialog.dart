import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/buttons/small_button.dart';

class AcheievementGetDialog extends StatelessWidget {
  final String icon;
  final String header;
  final void Function()? onPressed;
  const AcheievementGetDialog({
    super.key,
    this.onPressed,
    required this.icon,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromRGBO(91, 88, 102, 1),
      shadowColor: Color.fromRGBO(0, 0, 0, 0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Получено новое достижение!",
              textAlign: TextAlign.center,
              style: AppTextStyles.buttonLargeStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            Text(
              "Посетите страницу достижений, чтобы узнать подробнее.",
              textAlign: TextAlign.center,
              style: AppTextStyles.buttonLargeStyle.copyWith(
                height: 18.h / 16.h,
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 50.r,
                    height: 45.r,
                  ),
                  SizedBox(width: 5.h),
                  Flexible(
                    child: Text(
                      header,
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        height: 28.h / 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SmallButton(
              backgroundColor: AppColors.green,
              shadowColor: AppColors.yellow,
              textColor: AppColors.black,
              text: "Принять",
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
