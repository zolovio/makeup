import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailOtpVerificationVmProvider =
    ChangeNotifierProvider.autoDispose<EmailOtpVerificationVm>((ref) {
  return EmailOtpVerificationVm();
});

class EmailOtpVerificationVm extends ChangeNotifier {
  void onContinueTap() {}
}
