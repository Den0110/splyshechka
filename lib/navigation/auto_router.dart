import 'package:auto_route/auto_route.dart';
import 'package:splyshechka/navigation/route_builders.dart';
import 'package:splyshechka/pages/alarm/good_morning/good_morning_page.dart';
import 'package:splyshechka/pages/alarm/result/alarm_result_page.dart';
import 'package:splyshechka/pages/alarm/set_sleep_time_details/set_sleep_time_details_page.dart';
import 'package:splyshechka/pages/alarm/settings/alarm_settings_page.dart';
import 'package:splyshechka/pages/alarm/sleeping/alarm_sleeping_page.dart';
import 'package:splyshechka/pages/alarm/snooze/snooze_page.dart';
import 'package:splyshechka/pages/articles/article_details_page.dart';
import 'package:splyshechka/pages/articles/articles_page.dart';
import 'package:splyshechka/pages/home/home_page.dart';
import 'package:splyshechka/pages/login/login_page.dart';
import 'package:splyshechka/pages/login/password_retrieval/password_retrieval_page.dart';
import 'package:splyshechka/pages/login/registration/registration_page.dart';
import 'package:splyshechka/pages/main/main_page.dart';
import 'package:splyshechka/pages/profile/edit_avatar/profile_settings_avatar_page.dart';
import 'package:splyshechka/pages/profile/edit_email/profile_settings_email_page.dart';
import 'package:splyshechka/pages/profile/edit_gender/profile_settings_gender_page.dart';
import 'package:splyshechka/pages/profile/edit_name/profile_settings_name_page.dart';
import 'package:splyshechka/pages/profile/edit_password/profile_settings_password.dart';
import 'package:splyshechka/pages/profile/profile/profile_page.dart';
import 'package:splyshechka/pages/profile/settings/profile_settings_page.dart';
import 'package:splyshechka/pages/statistics/statistics_page.dart';

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
      page: LoginPage,
    ),
    AutoRoute(
          page: PasswordRetrievalPage,
        ),
    AutoRoute(
          page: RegistrationPage,
        ),
    AutoRoute(
      page: ArticleDetailsPage,
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
    CustomRoute(
      page: SetSleepTimeDetailsPage,
      customRouteBuilder: regularPageBuilder,
    ),
    CustomRoute(
      page: SnoozePage,
      customRouteBuilder: bottomSheetBuilder,
    ),
    CustomRoute(
      page: GoodMorningPage,
      customRouteBuilder: regularPageBuilder,
    ),
    CustomRoute(
      page: AlarmSettingsPage,
      customRouteBuilder: fullscreenBottomSheetBuilder,
    ),
    CustomRoute(
      page: AlarmSleepingPage,
      customRouteBuilder: regularPageBuilder,
    ),
    CustomRoute(
      page: AlarmResultPage,
      customRouteBuilder: regularPageBuilder,
    ),
  ],
)
class $AppRouter {}
