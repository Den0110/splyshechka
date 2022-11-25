
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pillow/models/notifications/notification_type.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/buttons/circle_icon_button.dart';

class NotificationWithIcon extends StatelessWidget {
  final String title;
  final String subTitle;
  final NotificationType type;
  final VoidCallback? onPressed;
  final VoidCallback? onClosed;

  const NotificationWithIcon({
    Key? key,
    required this.subTitle,
    required this.title,
    required this.type,
    this.onClosed,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(13.r),
      ),
      padding: EdgeInsets.all(10.r),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 10.w,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.alarm,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.notificationsTitle
                        .copyWith(fontSize: 15.sp, height: 20.h / 15.sp),
                  ),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.notificationsSubTitle
                        .copyWith(fontSize: 12.sp, height: 18.h / 12.sp),
                  ),
                ],
              ),
            ),
            type == NotificationType.closeable
                ? Align(
                    alignment: Alignment.topRight,
                    child: CircleIconButton(
                      icon: SvgPicture.asset(
                        AppIcons.closed,
                        color: AppColors.white,
                      ),
                      onPressed: onClosed!,
                    ),
                  )
                : type == NotificationType.openable
                    ? Align(
                        alignment: Alignment.center,
                        child: CircleIconButton(
                          borderColor: null,
                          icon: SvgPicture.asset(
                            AppIcons.arrowRight,
                            color: AppColors.white,
                          ),
                          onPressed: onPressed!,
                        ),
                      )
                    : const SizedBox()
          ],
        ),
      ),
    );
  }
}
