import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:makeup/splash_screen.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Board',
      theme: lightTheme,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
