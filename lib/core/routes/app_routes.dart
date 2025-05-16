import 'package:doctorhunt/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:doctorhunt/feature/sign%20up/presentation/views/signup_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kAppLogo = '/';
  static const kSignIn = '/login';
  static const kForget = '/forget';
  static const kSignup = "/signup";
  static const ksplash = "/splash";
  static const kVerifiy = "/verify";
  static const kHome = "/home";
  static const kresetpassword = "/resetpassword";
  static const kForgotVerifiy = "/forgotverifiy";
  static const kDetails = "/details";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kAppLogo, builder: (context, state) => const OnboardingView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
