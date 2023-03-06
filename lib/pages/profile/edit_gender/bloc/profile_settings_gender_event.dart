part of 'profile_settings_gender_bloc.dart';

@freezed
class ProfileSettingsGenderEvent with _$ProfileSettingsGenderEvent {
  const factory ProfileSettingsGenderEvent.savePressed() = SavePressed;

  const factory ProfileSettingsGenderEvent.cancelPressed() = CancelPressed;

  const factory ProfileSettingsGenderEvent.genderChanged(
      {required Gender gender}) = GenderChanged;
}
