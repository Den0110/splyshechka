import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/data/data_source/user/remote/new_user_remote_data_source.dart';
import 'package:splyshechka/data/model/new_user/sleep_user_sign_up_dto.dart';
import 'package:splyshechka/models/gender/gender.dart';

part 'registration_event.dart';
part 'registration_state.dart';
part 'registration_command.dart';
part 'registration_bloc.freezed.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState>
    with SideEffectBlocMixin<RegistrationState, RegistrationCommand> {
  final NewUserRemoteDataSource _dataSource;
  RegistrationBloc(this._dataSource)
      : super(const _Initial(
          gender: Gender.male,
        )) {
    on<_SignUpClicked>(_onSignUpClicked);
    on<_GenderChanged>(_onGenderChanged);
  }

  void _onGenderChanged(
    _GenderChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onSignUpClicked(
    _SignUpClicked event,
    Emitter<RegistrationState> emit,
  ) async {
    _dataSource.signUpUser(SleepUserSignUpDto(
      username: event.nickname,
      fullName: event.fullname,
      email: event.email,
      password: event.password,
      gender: state.gender.jsonName,
    ));
  }
}
