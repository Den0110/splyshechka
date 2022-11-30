import 'package:auto_route/auto_route.dart';
import 'package:my_pillow/pages/articles/articles_page.dart';
import 'package:my_pillow/pages/home/home_page.dart';
import 'package:my_pillow/pages/main/main_page.dart';
import 'package:my_pillow/pages/profile/edit_avatar/profile_settings_avatar_page.dart';
import 'package:my_pillow/pages/profile/edit_email/profile_settings_email_page.dart';
import 'package:my_pillow/pages/profile/edit_gender/profile_settings_gender_page.dart';
import 'package:my_pillow/pages/profile/edit_name/profile_settings_name_page.dart';
import 'package:my_pillow/pages/profile/edit_password/profile_settings_password.dart';
import 'package:my_pillow/pages/profile/profile/profile_page.dart';
import 'package:my_pillow/pages/profile/settings/profile_settings_page.dart';
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
    AutoRoute(
      page: ProfilePage,
    ),
    AutoRoute(
      page: ProfileSettingsPage,
    ),
    AutoRoute(
      page: ProfileSettingsNamePage,
    ),
    AutoRoute(
      page: ProfileSettingsPasswordPage,
    ),
    AutoRoute(
      page: ProfileSettingsEmailPage,
    ),
    AutoRoute(
      page: ProfileSettingsAvatarPage,
    ),
    AutoRoute(
      page: ProfileSettingsGenderPage,
    ),
  ],
)
class $AppRouter {}
