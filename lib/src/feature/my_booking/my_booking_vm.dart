import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

final myBookingVmProvider =
    ChangeNotifierProvider.autoDispose<MyBookingVm>((ref) {
  return MyBookingVm();
});

class MyBookingVm extends ChangeNotifier {
  bool isOpen = false;
  void onContinueTap() {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(AppRouter.login, (route) => false);
  }

  void onSaveTap() {}

  void onOpenTap() {
    isOpen = !isOpen;
    notifyListeners();
  }
}
