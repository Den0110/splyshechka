
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pillow/models/notifications/notification_type.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/buttons/circle_icon_button.dart';

class NotificationWithOutImage extends StatelessWidget {
  final String title;
  final String? subTitle;
  final NotificationType type;
  final Color color;
  final Color? titleColor;
  final Color? subtitleColor;
  final VoidCallback? onPressed;
  final VoidCallback? onClosed;

  const NotificationWithOutImage({
    Key? key,
    required this.color,
    required this.title,
    this.titleColor,
    this.subtitleColor,
    this.subTitle,
    this.onClosed,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13.r),
      ),
      padding: EdgeInsets.all(10.r),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subTitle != null
                        ? AppTextStyles.notificationsTitle.copyWith(
                            color: titleColor,
                            fontSize: 15.sp,
                            height: 20.h / 15.sp,
                          )
                        : AppTextStyles.notificationsSubTitle.copyWith(
                            color: titleColor,
                            fontSize: 12.sp,
                            height: 18.h / 12.sp,
                          ),
                  ),
                  subTitle != null
                      ? Text(
                          subTitle!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.notificationsSubTitle.copyWith(
                            color: subtitleColor,
                            fontSize: 12.sp,
                            height: 18.h / 12.sp,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            type == NotificationType.closeable
                ? Align(
                    alignment: subTitle != null
                        ? Alignment.topRight
                        : Alignment.center,
                    child: CircleIconButton(
                      radius: 4,
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: CircleIconButton(
                            borderColor: null,
                            radius: 0,
                            icon: SvgPicture.asset(
                              AppIcons.arrowRight,
                              color: subtitleColor,
                            ),
                            onPressed: onPressed!,
                          ),
                        ),
                      )
                    : const SizedBox()
          ],
        ),
      ),
    );
  }
}
