import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/date_formatter.dart';

class ClockWidget extends StatelessWidget {
  final Color color;
  const ClockWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: DateFormat(DateFormat.HOUR24_MINUTE).format(
                      DateTime.now(),
                    ),
                    style: AppTextStyles.alarmNumber.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              DateTime.now().toRusWeekFormat(),
              style: AppTextStyles.alarmSubtitle.copyWith(
                color: color,
              ),
            ),
          ],
        );
      },
    );
  }
}
