import 'package:doctorhunt/feature/login/presentation/views/signin_view.dart';
import 'package:doctorhunt/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:doctorhunt/feature/sign%20up/presentation/views/signup_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kAppLogo = '/';
  static const kSignup = "/signup";
  static const kSignIn = '/signin';
  static const kForget = '/forget';
  static const ksplash = "/splash";
  static const kVerifiy = "/verify";
  static const kHome = "/home";
  static const kresetpassword = "/resetpassword";
  static const kForgotVerifiy = "/forgotverifiy";
  static const kDetails = "/details";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kAppLogo,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(path: kSignIn, builder: (context, state) => const SigninView()),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
