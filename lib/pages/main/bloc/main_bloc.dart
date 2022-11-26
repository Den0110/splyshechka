import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_pillow/pages/main/bloc/main_ui_model.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          const MainState.initial(
            uiModel: MainUiModel(balance: 91.001),
          ),
        ) {
    on<AvatarClicked>(_onAvatarClicked);
  }

  void _onAvatarClicked(event, emit) {
    emit(MainState.navToProfile(uiModel: state.uiModel));
  }
}
