import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/widgets/pin_code/pin_button.dart';
import 'package:my_pillow/widgets/pin_code/pin_progress.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    required this.password,
    required this.length,
    required this.onChanged,
    required this.onSubmitted,
  });

  final String password;
  final int length;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;

  void onTap(int i) {
    onChanged(password + i.toString());

    if (password.length + 1 == length) {
      onSubmitted(password + i.toString());
    }
  }

  void onErase() {
    if (password.isNotEmpty) {
      onChanged(password.substring(0, password.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 209.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PinProgress(length: length, filled: password.length),
          SizedBox(height: 35.h),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 26.h,
              crossAxisSpacing: 22.w,
            ),
            itemBuilder: (context, index) {
              switch (index) {
                case 9:
                  return const SizedBox();
                case 10:
                  return Center(
                    child: PinButton(
                      label: "0",
                      onTap: () {
                        onTap(0);
                      },
                    ),
                  );
                case 11:
                  return IconButton(
                    onPressed: onErase,
                    icon: Icon(
                      Icons.backspace,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  );
                default:
                  return Center(
                    child: PinButton(
                      label: (index + 1).toString(),
                      onTap: () {
                        onTap(index + 1);
                      },
                    ),
                  );
              }
            },
            itemCount: 12,
          ),
        ],
      ),
    );
  }
}
