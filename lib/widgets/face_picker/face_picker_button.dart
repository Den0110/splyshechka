

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';

class FacePickerButton extends StatelessWidget {
  final bool isSelected;
  final String pathImage;
  final VoidCallback onTap;
  const FacePickerButton({
    Key? key,
    required this.isSelected,
    required this.pathImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : AppColors.greyMain,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Image.network(pathImage, fit: BoxFit.cover),
      ),
    );
  }
}
