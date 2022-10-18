import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginVmProvider = ChangeNotifierProvider.autoDispose<LoginVm>((ref) {
  return LoginVm();
});

class LoginVm extends ChangeNotifier {
  bool isActive = false;

  void onSwitch() {
    log('SwitchTapped');
    isActive = !isActive;
    notifyListeners();
  }
}
