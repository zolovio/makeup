import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Later usage
  // setupDependencies();
  // await Firebase.initializeApp(
  //   name: 'myticketboard',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // NotificationService().initNotification();

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
          designSize: Size(500, 683),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MyApp();
          }),
    ),
  );
}
