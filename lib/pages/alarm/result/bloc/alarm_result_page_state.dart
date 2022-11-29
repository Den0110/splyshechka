part of 'alarm_result_page_bloc.dart';


@Freezed(equal: false)
class AlarmResultPageState with _$AlarmResultPageState {
  const factory AlarmResultPageState.initial() =  AlarmResultPageInitial;

  const factory AlarmResultPageState.dataLoaded({
    required String image,
    required SleepTime wentToBed,
    required SleepTime asleepAfter,
    required SleepTime totalSleep,
    required SleepTime inBed,
    required SleepTime wokeUp,
    required int noise,
    required double value,
    required int boxes,
    required int quality,
  }) =  AlarmResultPageDataLoaded;


}
