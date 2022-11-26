part of 'main_bloc.dart';

@Freezed(equal: false)
class MainState with _$MainState {
  @override
  MainUiModel get uiModel;

  const factory MainState.initial({
    required MainUiModel uiModel,
  }) = Initial;

  factory MainState.navToProfile({
    required MainUiModel uiModel,
  }) = NavToProfile;
}
