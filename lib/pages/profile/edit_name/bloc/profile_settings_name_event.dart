part of 'profile_settings_name_bloc.dart';

@freezed
class ProfileSettingsNameEvent with _$ProfileSettingsNameEvent {
  const factory ProfileSettingsNameEvent.savePressed() = SavePressed;
const factory ProfileSettingsNameEvent.delete() = Delete;
  const factory ProfileSettingsNameEvent.cancelPressed() = CancelPressed;

  const factory ProfileSettingsNameEvent.nameChanged({required String name}) = NameChanged;
}
