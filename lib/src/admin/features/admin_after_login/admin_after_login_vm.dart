import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/core/services/app_router.dart';
import '../../../../app.dart';

final adminAfterLoginVmProvider =
    ChangeNotifierProvider.autoDispose<AdminAfterLoginVm>((ref) {
  return AdminAfterLoginVm();
});

class AdminAfterLoginVm extends ChangeNotifier {
  bool _isCustomer = false;
  bool _isEmployee = false;

  bool get isCustomer => _isCustomer;

  void setIsCustomer(val) {
    _isCustomer = val;
  }

  bool get isEmployee => _isEmployee;

  void setIsEmployee(val) {
    _isEmployee = val;
  }

  void onCustomerTap() {
    setIsCustomer(true);
    setIsEmployee(false);
    navigatorKey.currentState!.pushNamed(AppRouter.adminDashboard);
  }

  void onEmployeeTap() {
    setIsCustomer(false);
    setIsEmployee(true);
    navigatorKey.currentState!.pushNamed(AppRouter.adminEmployeeDashboard);
  }
}
