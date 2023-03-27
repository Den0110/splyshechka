part of 'all_analysis_bloc.dart';

@freezed
class AllAnalysisEvent with _$AllAnalysisEvent {
  const factory AllAnalysisEvent.pageOpened() = PageOpened;
  const factory AllAnalysisEvent.onCardClicked({required int index}) =
      OnCardClicked;
}
