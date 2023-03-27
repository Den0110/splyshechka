part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial({
    required Gender gender,
  }) = _Initial;
}
