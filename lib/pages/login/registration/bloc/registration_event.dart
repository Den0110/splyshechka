part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.signUpClicked({
    required String nickname,
    required String fullname,
    required String email,
    required String password,
  }) = _SignUpClicked;

}