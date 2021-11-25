import 'package:get/get.dart';

import 'package:gcms/app/modules/ActiveGameScreen/bindings/active_game_screen_binding.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/active_game_screen_view.dart';
import 'package:gcms/app/modules/Authentication/bindings/login_binding.dart';
import 'package:gcms/app/modules/Authentication/views/login_view.dart';
import 'package:gcms/app/modules/Authentication/views/sign_up_view.dart';
import 'package:gcms/app/modules/Notifications/bindings/notifications_binding.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:gcms/app/modules/ResultsScreen/bindings/results_screen_binding.dart';
import 'package:gcms/app/modules/ResultsScreen/views/results_screen_view.dart';
import 'package:gcms/app/modules/ScoresInputScreen/bindings/scores_input_screen_binding.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/scores_input_screen_view.dart';
import 'package:gcms/app/modules/SettingScreen/bindings/setting_screen_binding.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/bindings/setup_screen_binding.dart';
import 'package:gcms/app/modules/SetupScreen/views/setup_screen_view.dart';
import 'package:gcms/app/modules/ViewPlayersScreen/bindings/view_players_screen_binding.dart';
import 'package:gcms/app/modules/ViewPlayersScreen/views/view_players_screen_view.dart';
import 'package:gcms/app/modules/home/bindings/home_binding.dart';
import 'package:gcms/app/modules/home/views/explore_screen_view.dart';
import 'package:gcms/app/modules/home/views/home_view.dart';
import 'package:gcms/app/modules/joinMatchScreen/bindings/join_match_screen_binding.dart';
import 'package:gcms/app/modules/joinMatchScreen/views/match_invites_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.SCORES_INPUT_SCREEN,
      page: () => ScoresInputScreenView(),
      binding: ScoresInputScreenBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
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
      binding: JoinMatchScreenBinding(),
    ),
  ];
}
