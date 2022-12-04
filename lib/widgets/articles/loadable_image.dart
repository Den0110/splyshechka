import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';


class LoadableImage extends StatelessWidget {
  final double width, height;
  final String? url;

  const LoadableImage(
    this.url, {
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  Widget get _errorPlaceholder {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return _errorPlaceholder;
    }
    return Image.network(
      url!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Shimmer.fromColors(
          baseColor: AppColors.white,
          highlightColor: AppColors.blue,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) => _errorPlaceholder,
      width: width,
      height: height,
    );
  }
}
