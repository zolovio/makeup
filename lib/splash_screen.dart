import 'package:flutter/material.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  nextScreen() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(
      seconds: 2,
    )).then((value) async {
      // if (sharedPreferences.getBool('login') != null) {
      //   navigatorKey.currentState?.pushReplacementNamed(AppRouter.homescreen);
      // } else {
      navigatorKey.currentState?.pushReplacementNamed(AppRouter.login);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
