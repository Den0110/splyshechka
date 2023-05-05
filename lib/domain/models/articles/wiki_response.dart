import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/domain/models/articles/article_category.dart';

part 'wiki_response.freezed.dart';

@freezed
class WikiResponse with _$WikiResponse {
  const factory WikiResponse({
    required List<ArticleCategory> categories,
  }) = _WikiResponse;

}
