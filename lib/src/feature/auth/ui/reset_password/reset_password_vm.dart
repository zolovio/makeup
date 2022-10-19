import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordVmProvider =
    ChangeNotifierProvider.autoDispose<ResetPasswordVm>((ref) {
  return ResetPasswordVm();
});

class ResetPasswordVm extends ChangeNotifier {
  void onContinueTap() {}
}
