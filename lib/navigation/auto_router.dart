import 'package:auto_route/auto_route.dart';
import 'package:my_pillow/pages/articles/articles_page.dart';
import 'package:my_pillow/pages/home/home_page.dart';
import 'package:my_pillow/pages/main/main_page.dart';
import 'package:my_pillow/pages/statistics/statistics_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      children: [
        AutoRoute(
          page: HomePage,
        ),
        AutoRoute(
          page: ArticlesPage,
        ),
        AutoRoute(
          page: StatisticsPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
