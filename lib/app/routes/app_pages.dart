import 'package:gcms/app/modules/CoursesScreen/bindings/course_binding.dart';
import 'package:gcms/app/modules/CoursesScreen/views/course_view.dart';
import 'package:gcms/app/modules/EventsScreen/bindings/event_screen_binding.dart';
import 'package:gcms/app/modules/EventsScreen/views/event_screen_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/ActiveGameScreen/bindings/active_game_screen_binding.dart';
import '../modules/ActiveGameScreen/views/active_game_screen_view.dart';
import '../modules/Authentication/bindings/login_binding.dart';
import '../modules/Authentication/views/login_view.dart';
import '../modules/Authentication/views/sign_up_view.dart';
import '../modules/Notifications/bindings/notifications_binding.dart';
import '../modules/Notifications/views/notification_details_view.dart';
import '../modules/Notifications/views/notifications_view.dart';
import '../modules/ResultsScreen/bindings/results_screen_binding.dart';
import '../modules/ResultsScreen/views/results_screen_view.dart';
import '../modules/SettingScreen/bindings/setting_screen_binding.dart';
import '../modules/SettingScreen/views/setting_screen_view.dart';
import '../modules/SetupScreen/bindings/setup_screen_binding.dart';
import '../modules/SetupScreen/views/setup_screen_view.dart';
import '../modules/ViewPlayersScreen/bindings/view_players_screen_binding.dart';
import '../modules/ViewPlayersScreen/views/view_players_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/match_invites_screen_view.dart';
import '../modules/tournamentsScreen/bindings/tournaments_screen_binding.dart';
import '../modules/tournamentsScreen/views/tournaments_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.NOTIFICATION_DETAILS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.ACTIVE_GAME_SCREEN,
      page: () => ActiveGameScreenView(),
      binding: ActiveGameScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.SCORES_INPUT_SCREEN,
    //   page: () => ScoresInputScreenView(),
    //   binding: ScoresInputScreenBinding(),
    // ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAILS,
      page: () => NotificationDetailsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PLAYERS_SCREEN,
      page: () => ViewPlayersScreenView(),
      binding: ViewPlayersScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS_SCREEN,
      page: () => ResultsScreenView(),
      binding: ResultsScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETUP_SCREEN,
      page: () => SetupScreenView(),
      binding: SetupScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_SCREEN,
      page: () => SettingScreenView(),
      binding: SettingScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOIN_MATCH_SCREEN,
      page: () => MatchInvitesScreenView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_SCREEN,
      page: () => EventScreenView(),
      binding: EventScreenBinding(),
    ),
    GetPage(
      name: _Paths.TOURNAMENTS_SCREEN,
      page: () => TournamentsScreenView(),
      binding: TournamentsScreenBinding(),
    ),
  ];
}
