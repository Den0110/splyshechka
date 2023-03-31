part of 'password_retrieval_bloc.dart';

@freezed
class PasswordRetrievalEvent with _$PasswordRetrievalEvent {
  const factory PasswordRetrievalEvent.sendCode({
    required String email,
  }) = SendCode;
  const factory PasswordRetrievalEvent.resetPassword({
    required String newPassword,
    required String code,
  }) = ResetPassword;
}
