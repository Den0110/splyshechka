import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';


@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required String content,
    required String outline,
    required String cardImageUrl,
  }) = _Article;

  factory Article.empty() => const Article(
        id: '',
        title: '',
        content: '',
        outline: '',
        cardImageUrl: '',
      );
}
