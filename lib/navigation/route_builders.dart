// ignore_for_file: unused_element

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:splyshechka/utils/app_colors.dart';

final _defaultBarrierColor = Colors.black.withOpacity(0.7);

Route<T> regularPageBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return MaterialWithModalsPageRoute(builder: (_) => child, settings: page);
}

Route<T> bottomSheetBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return CupertinoModalBottomSheetRoute<T>(
    builder: (_) => child,
    modalBarrierColor: _defaultBarrierColor,
    containerBuilder: (context, _, child) => _CupertinoBottomSheetContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          Container(
            height: 5.r,
            width: 80.w,
            decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: child,
          ),
        ],
      ),
      topRadius: Radius.circular(20.r),
    ),
    expanded: false,
    topRadius: Radius.circular(10.r),
    settings: page,
  );
}

Route<T> fullscreenBottomSheetBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return CupertinoModalBottomSheetRoute<T>(
    builder: (_) => child,
    modalBarrierColor: _defaultBarrierColor,
    containerBuilder: (context, _, child) => _CupertinoBottomSheetContainer(
      child: child,
      topRadius: Radius.circular(10.r),
    ),
    expanded: true,
    topRadius: Radius.circular(10.r),
    settings: page,
  );
}

Route<T> dialogBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return CupertinoDialogRoute<T>(
    context: context,
    barrierColor: _defaultBarrierColor,
    builder: (_) => Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.space,
          ),
          child: child,
        ),
      ),
    ),
    settings: page,
  );
}

const double _kPreviousPageVisibleOffset = 10;
const BoxShadow _kDefaultBoxShadow =
    BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);

class _CupertinoBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Radius topRadius;
  final BoxShadow? shadow;

  const _CupertinoBottomSheetContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
    required this.topRadius,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = _kPreviousPageVisibleOffset + topSafeAreaPadding;

    final shadow = this.shadow ?? _kDefaultBoxShadow;
    const BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);
    final backgroundColor = this.backgroundColor ??
        CupertinoTheme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: Container(
          decoration:
              BoxDecoration(color: backgroundColor, boxShadow: [shadow]),
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true, //Remove top Safe Area
            child: child,
          ),
        ),
      ),
    );
  }
}
