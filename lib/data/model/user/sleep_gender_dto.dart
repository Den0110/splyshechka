import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:splyshechka/models/gender/gender.dart';

enum GenderDto {
  @JsonValue("male")
  male,
  @JsonValue("female")
  female,
}

extension GenderMapper on GenderDto {
  Gender toModel() {
    switch (this) {
      case GenderDto.male:
        return Gender.male;
      case GenderDto.female:
        return Gender.female;
    }
  }

  static GenderDto fromModel(Gender gender) {
    switch (gender) {
      case Gender.male:
        return GenderDto.male;
      case Gender.female:
        return GenderDto.female;
    }
  }
}
