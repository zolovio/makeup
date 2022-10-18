import 'package:flutter/material.dart';
import 'package:makeup/splash_screen.dart';
import 'package:makeup/src/feature/auth/ui/login/login_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String forget = '/forget';
  static const String homescreen = '/home';
  static const String addEvent = '/addEvent';
  static const String eventDetails = '/eventDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

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
