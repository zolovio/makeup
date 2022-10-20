import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

final emailVerificationVmProvider =
    ChangeNotifierProvider.autoDispose<EmailVerificationVm>((ref) {
  return EmailVerificationVm();
});

class EmailVerificationVm extends ChangeNotifier {
  void onContinueTap() {}

  void onBackTap() {
    navigatorKey.currentState?.pop();
  }

  void onEnterCode(BuildContext context) {
    navigatorKey.currentState
        ?.pushReplacementNamed(AppRouter.emailOtpVerification);
  }
}
