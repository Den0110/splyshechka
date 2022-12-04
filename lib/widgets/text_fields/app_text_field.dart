
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/circle_icon_button.dart';


class AppTextField extends StatefulWidget {
  final String hint;
  final String? value;
  final Widget? icon;
  final Function(String) onChanged;
  final int? maxLines;
  final int? maxTextLength;

  const AppTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.icon,
    this.value,
    this.maxLines,
    this.maxTextLength,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != _controller.text) {
      _controller.text = widget.value ?? '';
      _controller.selection = TextSelection.collapsed(
        offset: widget.value?.length ?? 0,
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.greyMain),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxTextLength),
            ],
            maxLines: widget.maxLines ?? 1,
            cursorColor: AppColors.cursorColor,
            controller: _controller,
            style: AppTextStyles.fillTextFieldStyle.copyWith(
              fontSize: 15.sp,
              height: 22.h / 15.sp,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.unfocusBorder,
                  width: .5.w,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.focusBorder,
                  width: 1.5.w,
                ),
              ),
              hintText: widget.hint,
              hintStyle: AppTextStyles.hintStyle.copyWith(
                fontSize: 15.sp,
                height: 22.h / 15.sp,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.5.h,
                  horizontal: 12.5.w,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: widget.icon ?? const SizedBox(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleIconButton(
                        icon: SvgPicture.asset(
                          AppIcons.closed,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          _controller.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onChanged: widget.onChanged,
            onEditingComplete: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ),
      ),
    );
  }
}
