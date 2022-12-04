import 'package:splyshechka/utils/app_icons.dart';

enum Gender { male, female, other, secret }


extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      case Gender.secret:
        return 'Secret';
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
