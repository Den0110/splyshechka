import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/models/articles/article.dart';
import 'package:my_pillow/pages/articles/wiki_article/widgets/wiki_article_content.dart';
import 'package:my_pillow/widgets/articles/title_app_bar.dart';


class WikiArticlePage extends StatelessWidget {
  final Article article;

  const WikiArticlePage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(title: "Wiki"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              WikiArticleContent(text: article.content),
              SizedBox(height: 140.h),
            ],
          ),
        ),
      ),
    );
  }
}
