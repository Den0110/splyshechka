import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/models/gender/gender.dart';

enum GenderDto {
  @JsonValue("male")
  male,
  @JsonValue("female")
  female,
  @JsonValue("other")
  other,
  @JsonValue("secret")
  secret
}

extension GenderMapper on GenderDto {
  Gender toModel() {
    switch (this) {
      case GenderDto.male:
        return Gender.male;
      case GenderDto.female:
        return Gender.female;
      case GenderDto.other:
        return Gender.other;
      case GenderDto.secret:
        return Gender.secret;
    }
  }

  static GenderDto fromModel(Gender gender) {
    switch (gender) {
      case Gender.male:
        return GenderDto.male;
      case Gender.female:
        return GenderDto.female;
      case Gender.other:
        return GenderDto.other;
      case Gender.secret:
        return GenderDto.secret;
    }
  }
}
