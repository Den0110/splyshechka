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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/articles/articles_page.dart' as _i3;
import '../pages/home/home_page.dart' as _i2;
import '../pages/main/main_page.dart' as _i1;
import '../pages/statistics/statistics_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ArticlesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ArticlesPage(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.StatisticsPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i5.RouteConfig(
              ArticlesRoute.name,
              path: 'articles-page',
              parent: MainRoute.name,
            ),
            _i5.RouteConfig(
              StatisticsRoute.name,
              path: 'statistics-page',
              parent: MainRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ArticlesPage]
class ArticlesRoute extends _i5.PageRouteInfo<void> {
  const ArticlesRoute()
      : super(
          ArticlesRoute.name,
          path: 'articles-page',
        );

  static const String name = 'ArticlesRoute';
}

/// generated route for
/// [_i4.StatisticsPage]
class StatisticsRoute extends _i5.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: 'statistics-page',
        );

  static const String name = 'StatisticsRoute';
}
