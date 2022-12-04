// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/cupertino.dart' as _i22;
import 'package:flutter/material.dart' as _i20;

import '../models/articles/article.dart' as _i23;
import '../pages/alarm/good_morning/good_morning_page.dart' as _i12;
import '../pages/alarm/result/alarm_result_page.dart' as _i15;
import '../pages/alarm/set_sleep_time_details/model/sleep_time_type.dart'
    as _i24;
import '../pages/alarm/set_sleep_time_details/set_sleep_time_details_page.dart'
    as _i10;
import '../pages/alarm/settings/alarm_settings_page.dart' as _i13;
import '../pages/alarm/sleeping/alarm_sleeping_page.dart' as _i14;
import '../pages/alarm/snooze/snooze_page.dart' as _i11;
import '../pages/articles/article_details_page.dart' as _i2;
import '../pages/articles/articles_page.dart' as _i17;
import '../pages/home/home_page.dart' as _i16;
import '../pages/main/main_page.dart' as _i1;
import '../pages/profile/edit_avatar/profile_settings_avatar_page.dart' as _i8;
import '../pages/profile/edit_email/profile_settings_email_page.dart' as _i7;
import '../pages/profile/edit_gender/profile_settings_gender_page.dart' as _i9;
import '../pages/profile/edit_name/profile_settings_name_page.dart' as _i5;
import '../pages/profile/edit_password/profile_settings_password.dart' as _i6;
import '../pages/profile/profile/profile_page.dart' as _i3;
import '../pages/profile/settings/profile_settings_page.dart' as _i4;
import '../pages/statistics/statistics_page.dart' as _i18;
import 'route_builders.dart' as _i21;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ArticleDetailsPage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileSettingsPage(),
      );
    },
    ProfileSettingsNameRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileSettingsNamePage(),
      );
    },
    ProfileSettingsPasswordRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileSettingsPasswordPage(),
      );
    },
    ProfileSettingsEmailRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileSettingsEmailPage(),
      );
    },
    ProfileSettingsAvatarRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileSettingsAvatarPage(),
      );
    },
    ProfileSettingsGenderRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileSettingsGenderPage(),
      );
    },
    SetSleepTimeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SetSleepTimeDetailsRouteArgs>();
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.SetSleepTimeDetailsPage(
          key: args.key,
          initial: args.initial,
        ),
        customRouteBuilder: _i21.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SnoozeRoute.name: (routeData) {
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.SnoozePage(),
        customRouteBuilder: _i21.bottomSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GoodMorningRoute.name: (routeData) {
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.GoodMorningPage(),
        customRouteBuilder: _i21.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmSettingsRoute.name: (routeData) {
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.AlarmSettingsPage(),
        customRouteBuilder: _i21.fullscreenBottomSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmSleepingRoute.name: (routeData) {
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.AlarmSleepingPage(),
        customRouteBuilder: _i21.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmResultRoute.name: (routeData) {
      return _i19.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.AlarmResultPage(),
        customRouteBuilder: _i21.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.HomePage(),
      );
    },
    ArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesRouteArgs>(
          orElse: () => const ArticlesRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.ArticlesPage(key: args.key),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.StatisticsPage(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i19.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i19.RouteConfig(
              ArticlesRoute.name,
              path: 'articles-page',
              parent: MainRoute.name,
            ),
            _i19.RouteConfig(
              StatisticsRoute.name,
              path: 'statistics-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          ArticleDetailsRoute.name,
          path: '/article-details-page',
        ),
        _i19.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsRoute.name,
          path: '/profile-settings-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsNameRoute.name,
          path: '/profile-settings-name-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsPasswordRoute.name,
          path: '/profile-settings-password-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsEmailRoute.name,
          path: '/profile-settings-email-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsAvatarRoute.name,
          path: '/profile-settings-avatar-page',
        ),
        _i19.RouteConfig(
          ProfileSettingsGenderRoute.name,
          path: '/profile-settings-gender-page',
        ),
        _i19.RouteConfig(
          SetSleepTimeDetailsRoute.name,
          path: '/set-sleep-time-details-page',
        ),
        _i19.RouteConfig(
          SnoozeRoute.name,
          path: '/snooze-page',
        ),
        _i19.RouteConfig(
          GoodMorningRoute.name,
          path: '/good-morning-page',
        ),
        _i19.RouteConfig(
          AlarmSettingsRoute.name,
          path: '/alarm-settings-page',
        ),
        _i19.RouteConfig(
          AlarmSleepingRoute.name,
          path: '/alarm-sleeping-page',
        ),
        _i19.RouteConfig(
          AlarmResultRoute.name,
          path: '/alarm-result-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i19.PageRouteInfo<void> {
  const MainRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.ArticleDetailsPage]
class ArticleDetailsRoute extends _i19.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i22.Key? key,
    required _i23.Article article,
  }) : super(
          ArticleDetailsRoute.name,
          path: '/article-details-page',
          args: ArticleDetailsRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleDetailsRoute';
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({
    this.key,
    required this.article,
  });

  final _i22.Key? key;

  final _i23.Article article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.ProfileSettingsPage]
class ProfileSettingsRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: '/profile-settings-page',
        );

  static const String name = 'ProfileSettingsRoute';
}

/// generated route for
/// [_i5.ProfileSettingsNamePage]
class ProfileSettingsNameRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsNameRoute()
      : super(
          ProfileSettingsNameRoute.name,
          path: '/profile-settings-name-page',
        );

  static const String name = 'ProfileSettingsNameRoute';
}

/// generated route for
/// [_i6.ProfileSettingsPasswordPage]
class ProfileSettingsPasswordRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsPasswordRoute()
      : super(
          ProfileSettingsPasswordRoute.name,
          path: '/profile-settings-password-page',
        );

  static const String name = 'ProfileSettingsPasswordRoute';
}

/// generated route for
/// [_i7.ProfileSettingsEmailPage]
class ProfileSettingsEmailRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsEmailRoute()
      : super(
          ProfileSettingsEmailRoute.name,
          path: '/profile-settings-email-page',
        );

  static const String name = 'ProfileSettingsEmailRoute';
}

/// generated route for
/// [_i8.ProfileSettingsAvatarPage]
class ProfileSettingsAvatarRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsAvatarRoute()
      : super(
          ProfileSettingsAvatarRoute.name,
          path: '/profile-settings-avatar-page',
        );

  static const String name = 'ProfileSettingsAvatarRoute';
}

/// generated route for
/// [_i9.ProfileSettingsGenderPage]
class ProfileSettingsGenderRoute extends _i19.PageRouteInfo<void> {
  const ProfileSettingsGenderRoute()
      : super(
          ProfileSettingsGenderRoute.name,
          path: '/profile-settings-gender-page',
        );

  static const String name = 'ProfileSettingsGenderRoute';
}

/// generated route for
/// [_i10.SetSleepTimeDetailsPage]
class SetSleepTimeDetailsRoute
    extends _i19.PageRouteInfo<SetSleepTimeDetailsRouteArgs> {
  SetSleepTimeDetailsRoute({
    _i22.Key? key,
    required _i24.SleepTimeType initial,
  }) : super(
          SetSleepTimeDetailsRoute.name,
          path: '/set-sleep-time-details-page',
          args: SetSleepTimeDetailsRouteArgs(
            key: key,
            initial: initial,
          ),
        );

  static const String name = 'SetSleepTimeDetailsRoute';
}

class SetSleepTimeDetailsRouteArgs {
  const SetSleepTimeDetailsRouteArgs({
    this.key,
    required this.initial,
  });

  final _i22.Key? key;

  final _i24.SleepTimeType initial;

  @override
  String toString() {
    return 'SetSleepTimeDetailsRouteArgs{key: $key, initial: $initial}';
  }
}

/// generated route for
/// [_i11.SnoozePage]
class SnoozeRoute extends _i19.PageRouteInfo<void> {
  const SnoozeRoute()
      : super(
          SnoozeRoute.name,
          path: '/snooze-page',
        );

  static const String name = 'SnoozeRoute';
}

/// generated route for
/// [_i12.GoodMorningPage]
class GoodMorningRoute extends _i19.PageRouteInfo<void> {
  const GoodMorningRoute()
      : super(
          GoodMorningRoute.name,
          path: '/good-morning-page',
        );

  static const String name = 'GoodMorningRoute';
}

/// generated route for
/// [_i13.AlarmSettingsPage]
class AlarmSettingsRoute extends _i19.PageRouteInfo<void> {
  const AlarmSettingsRoute()
      : super(
          AlarmSettingsRoute.name,
          path: '/alarm-settings-page',
        );

  static const String name = 'AlarmSettingsRoute';
}

/// generated route for
/// [_i14.AlarmSleepingPage]
class AlarmSleepingRoute extends _i19.PageRouteInfo<void> {
  const AlarmSleepingRoute()
      : super(
          AlarmSleepingRoute.name,
          path: '/alarm-sleeping-page',
        );

  static const String name = 'AlarmSleepingRoute';
}

/// generated route for
/// [_i15.AlarmResultPage]
class AlarmResultRoute extends _i19.PageRouteInfo<void> {
  const AlarmResultRoute()
      : super(
          AlarmResultRoute.name,
          path: '/alarm-result-page',
        );

  static const String name = 'AlarmResultRoute';
}

/// generated route for
/// [_i16.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i17.ArticlesPage]
class ArticlesRoute extends _i19.PageRouteInfo<ArticlesRouteArgs> {
  ArticlesRoute({_i22.Key? key})
      : super(
          ArticlesRoute.name,
          path: 'articles-page',
          args: ArticlesRouteArgs(key: key),
        );

  static const String name = 'ArticlesRoute';
}

class ArticlesRouteArgs {
  const ArticlesRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'ArticlesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.StatisticsPage]
class StatisticsRoute extends _i19.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: 'statistics-page',
        );

  static const String name = 'StatisticsRoute';
}
