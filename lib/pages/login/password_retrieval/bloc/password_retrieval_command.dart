part of 'password_retrieval_bloc.dart';

@freezed
class PasswordRetrievalCommand with _$PasswordRetrievalCommand {
  factory PasswordRetrievalCommand.navToLogin() = NavToLogin;
  factory PasswordRetrievalCommand.error() = Error;
}
