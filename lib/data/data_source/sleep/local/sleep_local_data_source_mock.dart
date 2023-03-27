import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/model/sleep/sleep_dto.dart';

class SleepRemoteDataSourceMock {
 /* List<SleepDto> db = [
    const SleepDto(
      id: 0,
      avatar: SleepAvatarDto(
        imageUrl:
            "https://drive.google.com/uc?export=view&id=1gnHBRgL1gV0Q7ewRt8bywXeVVF4M_Fmu",
        color: 0xffffffff,
      ),
      fullName: "Denis C",
      nickname: "durak",
      email: "denis_c@mail.ru",
      token: "",
      sound: false,
      gender: GenderDto.male,
    ),
  ];*

  @override
  Future<SleepDto> fetchSleep(int id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => db.firstWhere((e) => e.id == id),
    );
  }

  @override
  Future<SleepDto> updateSleep(int id, SleepDto Sleep) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => db[db.indexWhere((e) => e.id == id)] = Sleep,
    );
  }*/
}
