import 'package:bloc/bloc.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/non_reset_password_dto.dart';
import 'package:splyshechka/data/model/new_user/non_send_email_code_dto.dart';

part 'password_retrieval_event.dart';
part 'password_retrieval_state.dart';
part 'password_retrieval_command.dart';
part 'password_retrieval_bloc.freezed.dart';

@injectable
class PasswordRetrievalBloc
    extends Bloc<PasswordRetrievalEvent, PasswordRetrievalState>
    with SideEffectBlocMixin<PasswordRetrievalState, PasswordRetrievalCommand> {
  final NewUserRemoteDataSource _dataSource;
  PasswordRetrievalBloc(this._dataSource) : super(_Initial()) {
    on<ResetPassword>(onResetPassword);
    on<SendCode>(onSendCode);
  }

  Future<void> onSendCode(
    SendCode event,
    Emitter<PasswordRetrievalState> emit,
  ) async {
    await _dataSource.nonSendEmailCode(
      NonSendEmailCodeDto(email: event.email),
    );
  }

  Future<void> onResetPassword(
    ResetPassword event,
    Emitter<PasswordRetrievalState> emit,
  ) async {
    try {
      await _dataSource.nonResetPassword(
        NonResetPasswordDto(
          resetCode: event.code,
          newPassword: event.newPassword,
        ),
      );
      produceSideEffect(PasswordRetrievalCommand.navToLogin());
    } catch (e) {
      produceSideEffect(PasswordRetrievalCommand.error());
    }
  }
}
