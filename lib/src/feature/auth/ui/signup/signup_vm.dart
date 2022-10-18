import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}
