import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:splyshechka/data/data_source/user/remote/user_remote_data_source.dart';
import 'package:splyshechka/data/model/user/sleep_avatar_dto.dart';
import 'package:splyshechka/data/model/user/sleep_gender_dto.dart';
import 'package:splyshechka/data/model/user/sleep_user_dto.dart';

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceMock extends UserRemoteDataSource {
  List<SleepUserDto> db = [
    const SleepUserDto(
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
    const SleepUserDto(
      id: 111,
      avatar: SleepAvatarDto(
        imageUrl:
            "https://drive.google.com/uc?export=view&id=1gnHBRgL1gV0Q7ewRt8bywXeVVF4M_Fmu",
        color: 0xffffffff,
      ),

      fullName: "Sleep N",
      nickname: "sleepeshka",
      email: "sleep-n@mail.ru",
      sound: false,
      token: "",
      gender: GenderDto.male,
    ),
  ];

  @override
  Future<SleepUserDto> fetchUser(int id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => db.firstWhere((e) => e.id == id),
    );
  }

  @override
  Future<SleepUserDto> updateUser(int id, SleepUserDto user) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => db[db.indexWhere((e) => e.id == id)] = user,
    );
  }

  String emailCode = "";
  @override
  Future<void> sendEmailCode() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        var rnd = Random();
        String code = "";
        for (var i = 1; i < 6; i++) {
          code += rnd.nextInt(10).toString();
        }
        print(code);
        emailCode = code;
      },
    );
  }

  @override
  Future<void> updatePassword({
    required String newPassword,
    required String code,
  }) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (code != emailCode) {
          throw Exception("The code is wrong");
        }
        return;
      },
    );
  }
}
