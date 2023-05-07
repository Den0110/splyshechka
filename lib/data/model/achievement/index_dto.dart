import 'package:freezed_annotation/freezed_annotation.dart';

part 'index_dto.freezed.dart';
part 'index_dto.g.dart';

@freezed
class IndexDto with _$IndexDto {
  const factory IndexDto({
    required int index,
  }) = _IndexDto;

  factory IndexDto.fromJson(Map<String, dynamic> json) =>
      _$IndexDtoFromJson(json);
}
