import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/domain/models/bottom_bars/app_bottom_bar_items.dart';

class AppBottomBarButton extends StatelessWidget {
  final bool isEnabled;
  final AppBottomBarItem icon;
  final VoidCallback onTap;
  const AppBottomBarButton({
    Key? key,
    required this.icon,
    required this.isEnabled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 7.h,
          bottom: 17.h,
          left: 25.w,
          right: 25.w,
        ),
        child: isEnabled ? icon.iconEnabled : icon.iconDisabled,
      ),
    );
  }
}
