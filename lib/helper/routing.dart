

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ojoregedapp/presentation/user_auth/login_page.dart';
import 'package:ojoregedapp/presentation/user_auth/registration.dart';

import '../presentation/Home/Dashboard.dart';
import '../presentation/splash_screen.dart';
import '../presentation/onboarding_screen.dart';
import '../presentation/user_auth/user_auth.dart';

class AppRoutes {
  AppRoutes._();
  static const initial = '/splashScreen';
  static final routes = [
    GetPage(
        name: '/splashScreen',
        page: () => const SplashScreen(),
        transition: Transition.zoom),
    GetPage(
        name: '/Onboarding',
        page: () => Onbording(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/UserAuth',
        page: () => UserAuth(),
        transition: Transition.zoom),
    GetPage(
        name: '/Login',
        page: () => Login_Page(),
        ),
    GetPage(
        name: '/Register',
        page: () => Register(),
        ),
    GetPage(
      name: '/Home',
      page: () => Profile_Page(),
    ),
  ];
}