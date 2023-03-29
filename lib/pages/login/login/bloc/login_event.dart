part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;

  const factory LoginEvent.signInClicked({
    required String email,
    required String password,
  }) = SignInClicked;

  const factory LoginEvent.signInEmailClicked({
    required String email,
    required String password,
  }) = SignInEmailClicked;
}
