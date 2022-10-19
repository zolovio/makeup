import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/common_widget/waiting_screen.dart';
import 'package:makeup/src/feature/auth/domain/usecase/auth_usecase.dart';

final loginVmProvider = ChangeNotifierProvider.autoDispose<LoginVm>((ref) {
  return LoginVm();
});

class LoginVm extends ChangeNotifier {
  late AuthUseCase _useCase;

  bool isActive = false;

  LoginVm() {
    _useCase = AuthUseCase();
  }

  void onSwitch() {
    log('SwitchTapped');
    isActive = !isActive;
    notifyListeners();
  }

  void onSignupTap(BuildContext context) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState!.pushNamed(AppRouter.signUp);
  }
}
