import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../manage_bookings/manage_booking_vm.dart';

final userDetailsVmProvider =
    ChangeNotifierProvider.autoDispose<UserDetailsVm>((ref) {
  return UserDetailsVm();
});

class UserDetailsVm extends ChangeNotifier {
  bool _isEditable = false;

  bool get isEditable => _isEditable;

  void setIsEdited(val) {
    _isEditable = val;
    notifyListeners();
  }

  void onDeleteTap() {}
  void onSaveTap() {
    print("Saved");
  }
}
