

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/widgets/face_picker/face_picker_button.dart';

class FacePicker extends StatelessWidget {
  final String selectedImage;
  final Function(String) onTap;
  final List<String> values;

  const FacePicker({
    Key? key,
    required this.onTap,
    required this.selectedImage,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: values.length,
      itemBuilder: (context, index) => FacePickerButton(
        pathImage: values[index],
        isSelected: selectedImage == values[index],
        onTap: () {
          if (selectedImage != values[index]) {
            onTap(values[index]);
          }
        },
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1,
        maxCrossAxisExtent: 80.w,
      ),
    );
  }
}
