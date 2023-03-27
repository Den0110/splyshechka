import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';
/*
class SleepRepositoryImpl  {
  final SleepRemoteDataSource _remoteDataSource;

  SleepRepositoryImpl(this._remoteDataSource) {
    _fetchSleep();
  }

  Future<void> _fetchSleep() async {
    final Sleep = (await _remoteDataSource.fetchSleep(111)).toModel();
    currentSleep.add(Sleep);
  }

  @override
  Future<void> updateSleep(SleepDto Sleep) async {
    currentSleep.add(Sleep);
   // await _remoteDataSource.updateSleep(
    //  Sleep.id,
   //   SleepSleepMapper.fromModel(Sleep),
   // );
  }
}
*/