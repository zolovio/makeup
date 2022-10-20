import 'package:flutter/material.dart';
import 'package:makeup/splash_screen.dart';
import 'package:makeup/src/feature/auth/ui/email_otp_verification/email_otp_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/email_verification/email_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/login/login_screen.dart';
import 'package:makeup/src/feature/auth/ui/mobile_otp_verification/mobile_otp_verification_screen.dart';
import 'package:makeup/src/feature/auth/ui/reset_password/reset_password_screen.dart';
import 'package:makeup/src/feature/auth/ui/signup/signup_screen.dart';
import 'package:makeup/src/feature/categories/dash_board.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forget = '/forget';
  static const String dashboard = '/dashboard';
  static const String mobileOtpVerification = '/mobileOtpVerification';
  static const String emailOtpVerification = '/emailOtpVerification';
  static const String emailVerification = '/emailVerification';
  static const String eventDetails = '/eventDetails';

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
