import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/models/articles/article.dart';
import 'package:my_pillow/models/articles/article_category.dart';

import 'package:my_pillow/pages/articles/wiki/widgets/wiki_card.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';


class WikiCategory extends StatelessWidget {
  final ArticleCategory articleCategory;
  final Function(Article) onArticlePressed;
  final bool isLoading;

  const WikiCategory({
    Key? key,
    required this.articleCategory,
    required this.onArticlePressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? Shimmer.fromColors(
                baseColor: AppColors.white,
                highlightColor: AppColors.blue,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  width: (200 + Random().nextInt(100) - 50).w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: AppColors.white,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Text(
                  articleCategory.title,
                  style: TextStyle(
                    fontSize: 22.sm,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                    color: Colors.grey.withOpacity(0.37),
                  ),
                ),
              ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            physics: isLoading
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 10.w,
                  right: index == articleCategory.articles.length - 1
                      ? 24.w
                      : 10.w,
                ),
                child: isLoading
                    ? Shimmer.fromColors(
                        baseColor: AppColors.white,
                        highlightColor: AppColors.blue,
                        child: Container(
                          width: 294.w,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.white,
                          ),
                        ),
                      )
                    : WikiCard(
                        article: articleCategory.articles[index],
                        onArticlePressed: onArticlePressed,
                      ),
              );
            },
            itemCount: articleCategory.articles.length,
          ),
        ),
      ],
    );
  }
}
