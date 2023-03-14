import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splyshechka/utils/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.index,
    required this.count,
  });

  final int index;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: 2.h,
        dotWidth: 65.w,
        expansionFactor: 3,
        spacing: 12.w,
        dotColor: AppColors.lightGrey,
        activeDotColor: AppColors.green,
      ),
    );
  }
}