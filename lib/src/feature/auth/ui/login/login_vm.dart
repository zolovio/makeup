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

  void onRememberSwitch() {
    isActive = !isActive;
    notifyListeners();
  }

  void onSignupTap(BuildContext context) async {
    WaitingScreen.show(context);
    await Future.delayed(const Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState!.pushNamed(AppRouter.signUp);
  }

  void facebookLogin(BuildContext context) {}

  void googleLogin(BuildContext context) {}

  void onSignInTap(String email, String password, BuildContext context) {}

  Future<void> onFogotPasswordTap(BuildContext context) async {
    WaitingScreen.show(context);
    await Future.delayed(const Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState!.pushNamed(AppRouter.forget);
  }
}
