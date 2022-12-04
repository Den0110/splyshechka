import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/articles/article.dart';
import 'package:splyshechka/pages/articles/widgets/wiki_article_content.dart';


class ArticleDetailsPage extends StatelessWidget {
  final Article article;

  const ArticleDetailsPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
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
