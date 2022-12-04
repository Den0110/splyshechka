
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        dotHeight: 5.r,
        dotWidth: 5.r,
        expansionFactor: 3,
        spacing: 2.w,
        dotColor: AppColors.lightGrey,
        activeDotColor: AppColors.lightGrey,
      ),
    );
  }
}
