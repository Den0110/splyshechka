import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';

@freezed
class CardModel with _$CardModel{
 const factory CardModel({
    required String date,
    required String sleepAll,
    required String goBed,
    required String awake,
    required double sleepQuality,
  }) = _CardModel;
  
}
