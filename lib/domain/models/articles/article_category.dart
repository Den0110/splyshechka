import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/models/articles/article.dart';

part 'article_category.freezed.dart';

@freezed
class ArticleCategory with _$ArticleCategory {
  const factory ArticleCategory({
    required String id,
    required String title,
    required String label,
    required List<Article> articles,
  }) = _ArticleCategory;

}
