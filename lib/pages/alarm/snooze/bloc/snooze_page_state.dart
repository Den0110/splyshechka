part of 'snooze_page_bloc.dart';

@Freezed(equal: false)
class SnoozePageState with _$SnoozePageState {
  const factory SnoozePageState.initial({
    required int selectedIndex,
  }) = Initial;

  @Implements<OneShotState>()
  factory SnoozePageState.navBack() = NavBack;
}
