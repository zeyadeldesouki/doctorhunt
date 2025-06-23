import 'package:doctorhunt/feature/home/presentation/views/appointment_calendar_view.dart';
import 'package:doctorhunt/feature/home/presentation/views/appointment_view.dart';
import 'package:doctorhunt/feature/home/presentation/views/doctor_details.dart';
import 'package:doctorhunt/feature/home/presentation/views/favourite_doctor.dart';
import 'package:doctorhunt/feature/home/presentation/views/home_view.dart';
import 'package:doctorhunt/feature/home/presentation/views/popular_doctor.dart';
import 'package:doctorhunt/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:doctorhunt/feature/signin/presentation/views/signin_view.dart';
import 'package:doctorhunt/feature/signup/presentation/views/signup_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kApp = '/';
  static const kSignup = "/signup";
  static const kSignIn = '/signin';
  static const kHome = "/home";
  static const kAppointment = '/Appointment';
  static const kPopular = "/popular";
  static const kFavourite = "/favourite";
  static const kDoctordetails = "/resetpassword";
  static const kAppointmentCalendar = "/kappointmentCalendar";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kApp, builder: (context, state) => const OnboardingView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(path: kSignIn, builder: (context, state) => const SigninView()),
      GoRoute(path: kHome, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kPopular,
        builder: (context, state) => const PopularDoctor(),
      ),
      GoRoute(
        path: kFavourite,
        builder: (context, state) => const FavouriteDoctor(),
      ),
      GoRoute(
        path: kDoctordetails,
        builder: (context, state) => const DoctorDetails(),
      ),
      GoRoute(
        path: kAppointment,
        builder: (context, state) => const AppointmentView(),
      ),
      GoRoute(
        path: kAppointmentCalendar,
        builder: (context, state) => const AppointmentCalendarView(),
      ),
    ],
    // errorBuilder: (context, state) => const ErrorView(),
  );
}
