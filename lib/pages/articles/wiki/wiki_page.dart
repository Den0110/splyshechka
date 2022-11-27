import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/models/articles/article_category.dart';
import 'package:my_pillow/navigation/auto_router.gr.dart';
import 'package:my_pillow/models/articles/article.dart';
import 'package:my_pillow/pages/articles/wiki/widgets/wiki_category.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/widgets/articles/choice_chips.dart';
import 'package:shimmer/shimmer.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key}) : super(key: key);

  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return _WikiLoaded(
      categories: [],
    );
  }
}

class _WikiLoaded extends StatelessWidget {
  static const int _initialSelectedItem = 0;

  _WikiLoaded({required this.categories, Key? key}) : super(key: key);

  final List<ArticleCategory> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 22.h : 30.h,
            bottom: index == categories.length - 1 ? 100.h : 30.h,
          ),
          child: WikiCategory(
            articleCategory: categories[index],
            onArticlePressed: (Article article) {
              context.router.navigate(WikiArticleRoute(
                article: article,
              ));
            },
          ),
        );
      },
    );
  }
}

class _WikiLoading extends StatelessWidget {
  const _WikiLoading({Key? key}) : super(key: key);

  static const stubCategoriesNum = 5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.white,
            highlightColor: AppColors.blue,
            child: ChoiceChips(
              titles: List.filled(stubCategoriesNum, ' ' * 20),
              isScrollable: false,
              initialValue: 0,
              onTap: (index) {},
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stubCategoriesNum,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 22.h : 30.h,
                    bottom: index == stubCategoriesNum - 1 ? 100.h : 30.h,
                  ),
                  child: WikiCategory(
                    articleCategory: ArticleCategory(
                      id: '',
                      title: '',
                      label: '',
                      articles: <Article>[
                        Article.empty(),
                        Article.empty(),
                        Article.empty(),
                      ],
                    ),
                    isLoading: true,
                    onArticlePressed: (Article a) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
