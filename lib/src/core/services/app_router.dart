import 'package:flutter/material.dart';
import 'package:makeup/splash_screen.dart';
import 'package:makeup/src/admin/features/manage_bookings/manage_bookings.dart';
import 'package:makeup/src/feature/auth/ui/email_otp_verification/email_otp_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/email_verification/email_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/login/login_screen.dart';
import 'package:makeup/src/feature/auth/ui/mobile_otp_verification/mobile_otp_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/reset_password/reset_password_screen.dart';
import 'package:makeup/src/feature/auth/ui/signup/signup_screen.dart';
import 'package:makeup/src/feature/contact_us/contact_us_screen.dart';
import 'package:makeup/src/feature/dashboard/dash_board.dart';
import 'package:makeup/src/feature/home/category_details/category_details_screen.dart';
import 'package:makeup/src/feature/my_booking/my_booking_screen.dart';
import 'package:makeup/src/feature/profile/profile_screen.dart';

import '../../admin/features/admin_after_login/admin_after_login_screen.dart';
import '../../admin/features/admin_dashboard/admin_dashboard.dart';
import '../../admin/features/home/admin_home_screen.dart';
import '../../admin/features/manage_categories/manage_category_details/manage_category_details_screen.dart';
import '../../admin/features/manage_users/manage_users.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String myBooking = '/myBooking';
  static const String contactUs = '/contactUs';
  static const String signUp = '/signUp';
  static const String forget = '/forget';
  static const String dashboard = '/dashboard';
  static const String mobileOtpVerification = '/mobileOtpVerification';
  static const String emailOtpVerification = '/emailOtpVerification';
  static const String emailVerification = '/emailVerification';
  static const String eventDetails = '/eventDetails';
  static const String categoryDetails = '/categoryDetails';
  // admin screens
  static const String adminAfterLogin = '/adminAfterLogin';
  static const String adminHomeScreen = '/adminHomeScreen';
  static const String adminDashboard = '/adminDashboard';
  static const String manageBookingScreen = '/manageBookingScreen';
  static const String manageUsersScreen = '/manageUsersScreen';
  static const String manageCategoryDetails = '/manageCategoryDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case mobileOtpVerification:
        return MaterialPageRoute(builder: (_) => MobileOtpVerificationScreen());
      case forget:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case emailVerification:
        return MaterialPageRoute(builder: (_) => EmailVerificationScreen());
      case emailOtpVerification:
        return MaterialPageRoute(builder: (_) => EmailOtpVerificationScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashBoard());
      case categoryDetails:
        return MaterialPageRoute(builder: (_) => CategoryDetailsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case myBooking:
        return MaterialPageRoute(builder: (_) => MyBookingScreen());
      case contactUs:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      // admin Screen
      case adminAfterLogin:
        return MaterialPageRoute(builder: (_) => const AdminAfterLoginScreen());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboard());
      case adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      case manageBookingScreen:
        return MaterialPageRoute(builder: (_) => const ManageBookingScreen());
      case manageUsersScreen:
        return MaterialPageRoute(builder: (_) => const ManageUsersScreen());
      case manageCategoryDetails:
        return MaterialPageRoute(
            builder: (_) => const ManageCategoryDetailsScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
                  title: 'Route Not Found',
                  message: 'Error! The route ${settings.name} not found.',
                ));
    }
  }
}

class RouteErrorScreen extends StatelessWidget {
  final String title;
  final String message;

  const RouteErrorScreen({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
