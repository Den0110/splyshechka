
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/widgets/switchers/pick_option/option_creator.dart';

enum OptionStyle { highlightStyle, backgroundStyle }

class PickOption extends StatelessWidget {
  const PickOption({
    super.key,
    required this.options,
    required this.active,
    required this.optionStyle,
    required this.onTap,
  });

  final List<String> options;
  final void Function(int i) onTap;
  final int active;
  final OptionStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            onTap(i);
          },
          child: SizedBox(
            child: Center(
              child: OptionCreator(
                optionStyle: optionStyle,
                value: options[i],
                isActive: i == active,
              ),
            ),
          ),
        ),
        itemCount: options.length,
      ),
    );
  }
}
