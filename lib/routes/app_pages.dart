import 'package:get/get.dart';
import 'package:mental_health_mobile_application/auth/presentation/auth_login_screen.dart';
import 'package:mental_health_mobile_application/auth/presentation/auth_password_recovery_screen.dart';
import 'package:mental_health_mobile_application/auth/presentation/auth_signup_screen.dart';
import 'package:mental_health_mobile_application/home/presentation/main_home_page_screen.dart';

import '../launch_screen/presentation/welcome_screen.dart';
import '../onboard/presentation/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.ONBOARD,
      page: () => OnboardingScreen(),
    ),
    GetPage(name: Routes.LOGIN, page: () => AuthLoginScreen()),
    GetPage(name: Routes.SIGNUP, page: () => AuthSignUpScreen()),
    GetPage(
        name: Routes.FORGOT_PASSWORD,
        page: () => AuthPasswordRecoveryScreen(),
        fullscreenDialog: true,
        transition: Transition.native,
        popGesture: true),
    GetPage(name: Routes.HOME, page: () => MainHomePageScreen()),
  ];
}
