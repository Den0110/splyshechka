import 'package:splyshechka/utils/app_icons.dart';

enum Gender { male, female, other, secret }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Мужской';
      case Gender.female:
        return 'Женский';
      case Gender.other:
        return 'Другой';
      case Gender.secret:
        return 'Скрыт';
    }
  }

  String get icon {
    switch (this) {
      case Gender.male:
        return AppIcons.male;
      case Gender.female:
        return AppIcons.female;
      case Gender.other:
        return AppIcons.transgender;
      case Gender.secret:
        return AppIcons.question;
    }
  }
}
