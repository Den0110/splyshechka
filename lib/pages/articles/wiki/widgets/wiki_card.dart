import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/models/articles/article.dart';
import 'package:my_pillow/widgets/articles/loadable_image.dart';

class WikiCard extends StatelessWidget {
  final Article article;
  final Function(Article) onArticlePressed;

  const WikiCard({
    Key? key,
    required this.article,
    required this.onArticlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onArticlePressed(article),
      child: Container(
        width: 294.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              spreadRadius: 0.09,
              blurRadius: 5.0,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 22.h,
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color.fromRGBO(23, 23, 37, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sm,
                  height: 30.h / 28.sm,
                ),
              ),
              SizedBox(height: 17.h),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        article.outline,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sm,
                          height: 18.h / 11.sm,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: LoadableImage(
                        article.cardImageUrl,
                        width: 92.w,
                        height: 78.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
