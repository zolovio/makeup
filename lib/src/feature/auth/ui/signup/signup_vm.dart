import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/common_widget/waiting_screen.dart';

final signupVmProvider = ChangeNotifierProvider.autoDispose<SignupVm>((ref) {
  return SignupVm();
});

class SignupVm extends ChangeNotifier {
  bool isActive = false;

  void onSwitch() {
    log('SwitchTapped');
    isActive = !isActive;
    notifyListeners();
  }

  Future<void> onSignupTap(BuildContext context) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState?.pushNamed(AppRouter.mobileOtpVerification);
  }

  void onSignInTap(BuildContext context) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState?.pushReplacementNamed(AppRouter.login);
  }
}
