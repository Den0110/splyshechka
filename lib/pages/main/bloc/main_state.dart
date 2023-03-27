part of 'main_bloc.dart';

@Freezed(equal: false)
class MainState with _$MainState {
  const factory MainState.initial() = Initial;

  const factory MainState.pageOpen({
    required SleepUser user,
  }) = PageOpen;

  // factory MainState.navToProfile({
  //   required MainUiModel uiModel,
  // }) = NavToProfile;
}
