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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i12;

import '../pages/alarm/good_morning/good_morning_page.dart' as _i4;
import '../pages/alarm/result/alarm_result_page.dart' as _i7;
import '../pages/alarm/set_sleep_time_details/model/sleep_time_type.dart'
    as _i15;
import '../pages/alarm/set_sleep_time_details/set_sleep_time_details_page.dart'
    as _i2;
import '../pages/alarm/settings/alarm_settings_page.dart' as _i5;
import '../pages/alarm/sleeping/alarm_sleeping_page.dart' as _i6;
import '../pages/alarm/snooze/snooze_page.dart' as _i3;
import '../pages/articles/articles_page.dart' as _i9;
import '../pages/home/home_page.dart' as _i8;
import '../pages/main/main_page.dart' as _i1;
import '../pages/statistics/statistics_page.dart' as _i10;
import 'route_builders.dart' as _i13;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SetSleepTimeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SetSleepTimeDetailsRouteArgs>();
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.SetSleepTimeDetailsPage(
          key: args.key,
          initial: args.initial,
        ),
        customRouteBuilder: _i13.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SnoozeRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SnoozePage(),
        customRouteBuilder: _i13.bottomSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GoodMorningRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.GoodMorningPage(),
        customRouteBuilder: _i13.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmSettingsRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AlarmSettingsPage(),
        customRouteBuilder: _i13.fullscreenBottomSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmSleepingRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.AlarmSleepingPage(),
        customRouteBuilder: _i13.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AlarmResultRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.AlarmResultPage(),
        customRouteBuilder: _i13.regularPageBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    ArticlesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ArticlesPage(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.StatisticsPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              ArticlesRoute.name,
              path: 'articles-page',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              StatisticsRoute.name,
              path: 'statistics-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          SetSleepTimeDetailsRoute.name,
          path: '/set-sleep-time-details-page',
        ),
        _i11.RouteConfig(
          SnoozeRoute.name,
          path: '/snooze-page',
        ),
        _i11.RouteConfig(
          GoodMorningRoute.name,
          path: '/good-morning-page',
        ),
        _i11.RouteConfig(
          AlarmSettingsRoute.name,
          path: '/alarm-settings-page',
        ),
        _i11.RouteConfig(
          AlarmSleepingRoute.name,
          path: '/alarm-sleeping-page',
        ),
        _i11.RouteConfig(
          AlarmResultRoute.name,
          path: '/alarm-result-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.SetSleepTimeDetailsPage]
class SetSleepTimeDetailsRoute
    extends _i11.PageRouteInfo<SetSleepTimeDetailsRouteArgs> {
  SetSleepTimeDetailsRoute({
    _i14.Key? key,
    required _i15.SleepTimeType initial,
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

  final _i14.Key? key;

  final _i15.SleepTimeType initial;

  @override
  String toString() {
    return 'SetSleepTimeDetailsRouteArgs{key: $key, initial: $initial}';
  }
}

/// generated route for
/// [_i3.SnoozePage]
class SnoozeRoute extends _i11.PageRouteInfo<void> {
  const SnoozeRoute()
      : super(
          SnoozeRoute.name,
          path: '/snooze-page',
        );

  static const String name = 'SnoozeRoute';
}

/// generated route for
/// [_i4.GoodMorningPage]
class GoodMorningRoute extends _i11.PageRouteInfo<void> {
  const GoodMorningRoute()
      : super(
          GoodMorningRoute.name,
          path: '/good-morning-page',
        );

  static const String name = 'GoodMorningRoute';
}

/// generated route for
/// [_i5.AlarmSettingsPage]
class AlarmSettingsRoute extends _i11.PageRouteInfo<void> {
  const AlarmSettingsRoute()
      : super(
          AlarmSettingsRoute.name,
          path: '/alarm-settings-page',
        );

  static const String name = 'AlarmSettingsRoute';
}

/// generated route for
/// [_i6.AlarmSleepingPage]
class AlarmSleepingRoute extends _i11.PageRouteInfo<void> {
  const AlarmSleepingRoute()
      : super(
          AlarmSleepingRoute.name,
          path: '/alarm-sleeping-page',
        );

  static const String name = 'AlarmSleepingRoute';
}

/// generated route for
/// [_i7.AlarmResultPage]
class AlarmResultRoute extends _i11.PageRouteInfo<void> {
  const AlarmResultRoute()
      : super(
          AlarmResultRoute.name,
          path: '/alarm-result-page',
        );

  static const String name = 'AlarmResultRoute';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.ArticlesPage]
class ArticlesRoute extends _i11.PageRouteInfo<void> {
  const ArticlesRoute()
      : super(
          ArticlesRoute.name,
          path: 'articles-page',
        );

  static const String name = 'ArticlesRoute';
}

/// generated route for
/// [_i10.StatisticsPage]
class StatisticsRoute extends _i11.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: 'statistics-page',
        );

  static const String name = 'StatisticsRoute';
}
