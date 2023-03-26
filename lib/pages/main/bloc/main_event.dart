part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.avatarClicked() = AvatarClicked;
  const factory MainEvent.pageOpened() = PageOpened;
}
