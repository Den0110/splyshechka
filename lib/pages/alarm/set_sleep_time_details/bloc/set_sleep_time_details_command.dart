part of 'set_sleep_time_details_bloc.dart';

@freezed
class SetSleepTimeDetailsCommand with _$SetSleepTimeDetailsCommand {
   factory SetSleepTimeDetailsCommand.navToSnooze() = NavToSnooze;

  factory SetSleepTimeDetailsCommand.navBack() = NavBack;
}
