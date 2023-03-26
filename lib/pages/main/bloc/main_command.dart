part of 'main_bloc.dart';

@freezed
class MainCommand with _$MainCommand {
  const factory MainCommand.navToProfile() = NavToProfile;
}
