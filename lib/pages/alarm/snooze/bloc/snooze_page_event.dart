part of 'snooze_page_bloc.dart';

@Freezed(equal: false)
class SnoozePageEvent with _$SnoozePageEvent {
  const factory SnoozePageEvent.currentChanged({
    required int current,
  }) = CurrentChanged;

  const factory SnoozePageEvent.saveClicked() = SaveClicked;

  const factory SnoozePageEvent.cancelClicked() = CancelClicked;
}
