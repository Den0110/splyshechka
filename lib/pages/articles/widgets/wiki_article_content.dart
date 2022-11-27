import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_text_styles.dart';
import 'package:my_pillow/widgets/articles/loadable_image.dart';

class WikiArticleContent extends StatelessWidget {
  final String text;

  const WikiArticleContent({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ParsedText(
      text: text,
      style: TextStyle(
        fontFamily: AppTextStyles.fontFamilyOpenSans,
        fontSize: 16.sm,
        fontWeight: FontWeight.w400,
        color: const Color.fromRGBO(180, 180, 185, 1),
        height: 23 / 16.sm,
      ),
      parse: [
        MatchText(
          pattern: r'(?<!#)# (.*?)\n',
          renderWidget: ({required String text, required String pattern}) {
            final customRegExp = RegExp(pattern);
            final match = customRegExp.firstMatch(text) as Match;
            final displayText = match.group(1)!;
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 34.h, bottom: 16.h),
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 36.sm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    height: 40 / 36.sm,
                  ),
                ),
              ),
            );
          },
        ),
        MatchText(
          pattern: r'(?<!#)## (.*?)\n',
          renderWidget: ({required String text, required String pattern}) {
            final customRegExp = RegExp(pattern);
            final match = customRegExp.firstMatch(text) as Match;
            final displayText = match.group(1)!;
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sm,
                    fontWeight: FontWeight.w600,
                    height: 30 / 24.sm,
                  ),
                ),
              ),
            );
          },
        ),
        MatchText(
          pattern: r'<small>(.*?)</small>',
          renderWidget: ({required String text, required String pattern}) {
            final customRegExp = RegExp(pattern);
            final match = customRegExp.firstMatch(text) as Match;
            final displayText = match.group(1)!;
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48.h),
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 14.sm,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    height: 22 / 14.sm,
                  ),
                ),
              ),
            );
          },
        ),
        MatchText(
          pattern: r'!\[[^\]]*\]\((.*?)\s*("(?:.*[^"])")?\s*\)',
          renderWidget: ({required String text, required String pattern}) {
            final customRegExp = RegExp(pattern);
            final match = customRegExp.firstMatch(text) as Match;
            final url = match.group(1)!;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 36.h),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(151, 151, 151, 0.08),
                      spreadRadius: 0.09,
                      blurRadius: 10.0,
                      offset: Offset(0, 6),
                    ),
                  ],
                  border: Border.all(color: AppColors.darkGrey, width: 1.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: LoadableImage(
                    url,
                    width: double.infinity,
                    height: 227.h,
                  ),
                ),
              ),
            );
          },
        ),
        MatchText(
          pattern: r'\n',
          renderWidget: ({required String text, required String pattern}) {
            return const SizedBox(width: double.infinity);
          },
        ),
      ],
    );
  }
}
