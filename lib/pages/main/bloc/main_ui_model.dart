import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_model.freezed.dart';

@freezed
class MainUiModel with _$MainUiModel {
  const factory MainUiModel({
    required double balance,
  }) = _MainUiModel;
}
