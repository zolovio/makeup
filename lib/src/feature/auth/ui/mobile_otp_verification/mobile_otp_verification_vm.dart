import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mobileOtpVerificationVmProvider =
    ChangeNotifierProvider.autoDispose<MobileOtpVerificationVm>((ref) {
  return MobileOtpVerificationVm();
});

class MobileOtpVerificationVm extends ChangeNotifier {
  void onContinueTap() {}
}
