import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/models/articles/article.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/articles/widgets/wiki_card.dart';

class ArticlesPage extends StatelessWidget {
  ArticlesPage({Key? key}) : super(key: key);

  final articles = [
    Article.empty(),
    Article.empty(),
    Article.empty(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.only(
            top: index == 0 ? 24.h : 8.h,
            bottom: index == articles.length - 1 ? 24.h : 8.h,
            left: 24.w,
            right: 24.w,
          ),
          child: WikiCard(
            article: articles[index],
            onArticlePressed: (article) {
              context.router.navigate(ArticleDetailsRoute(article: article));
            },
          ),
        );
      },
    );
  }
}
