import 'package:splyshechka/utils/app_icons.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Мужской';
      case Gender.female:
        return 'Женский';
    }
  }

  String get jsonName {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }

  String get icon {
    switch (this) {
      case Gender.male:
        return AppIcons.male;
      case Gender.female:
        return AppIcons.female;
    }
  }
}
