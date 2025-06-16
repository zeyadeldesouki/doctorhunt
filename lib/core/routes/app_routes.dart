import 'package:doctorhunt/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:doctorhunt/feature/signup/presentation/views/signup_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kApp = '/';
  static const kSignup = "/signup";
  static const kSignIn = '/signin';
  static const kHome = "/home";
  static const kAppointment = '/Appointment';
  static const kpopular = "/popular";
  static const kfavourite = "/favourite";
  static const kdoctordetails = "/resetpassword";
  static const kForgotVerifiy = "/forgotverifiy";
  static const kDetails = "/details";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kApp, builder: (context, state) => const OnboardingView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      // GoRoute(path: kSignIn, builder: (context, state) => const SigninView()),
      // GoRoute(path: kHome, builder: (context, state) => const HomeView()),
      // GoRoute(
      //   path: kpopular,
      //   builder: (context, state) => const PopularDoctor(),
      // ),
      // GoRoute(
      //   path: kfavourite,
      //   builder: (context, state) => const FavouriteDoctor(),
      // ),
      // GoRoute(
      //   path: kdoctordetails,
      //   builder: (context, state) => const DoctorDetails(),
      // ),
      // GoRoute(
      //   path: kAppointment,
      //   builder: (context, state) => const AppointmentView(),
      // ),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
