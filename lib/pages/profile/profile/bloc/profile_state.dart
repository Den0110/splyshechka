part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {

  const factory ProfileState({
    required SleepUser user,
    required String version,
  }) = _ProfileState;

  @Implements<OneShotState>()
  factory ProfileState.navToProfileSettings() = NavToProfileSettings;

  @Implements<OneShotState>()
  factory ProfileState.navToTermsOfUse() = NavToTermsOfUse;

  @Implements<OneShotState>()
  factory ProfileState.navToPrivacyPolicy() = NavToPrivacyPolicy;

  @Implements<OneShotState>()
  factory ProfileState.navToMultiChain() = NavToMultiChain;

  @Implements<OneShotState>()
  factory ProfileState.navToRecords() = NavToRecords;

  @Implements<OneShotState>()
  factory ProfileState.logout() = Logout;
}
