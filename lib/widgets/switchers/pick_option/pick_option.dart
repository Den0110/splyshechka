import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/widgets/switchers/pick_option/option_creator.dart';

enum OptionStyle { highlightStyle, backgroundStyle }

class PickOption extends StatelessWidget {
  const PickOption({
    super.key,
    required this.options,
    required this.active,
    required this.optionStyle,
    required this.onTap,
    this.color,
  });

  final List<String> options;
  final void Function(int index)? onTap;
  final int active;
  final OptionStyle optionStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
          color: AppColors.stroke,
        ),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          children: options
              .map(
                (option) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onTap!(
                        options.indexOf(option),
                      );
                    },
                    child: OptionCreator(
                      optionStyle: optionStyle,
                      value: option,
                      isActive: option == options.elementAt(active),
                      color: color,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
