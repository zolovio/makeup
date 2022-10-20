import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

final resetPasswordVmProvider =
    ChangeNotifierProvider.autoDispose<ResetPasswordVm>((ref) {
  return ResetPasswordVm();
});

class ResetPasswordVm extends ChangeNotifier {
  void onContinueTap() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(AppRouter.login, (route) => false);
  }
}
