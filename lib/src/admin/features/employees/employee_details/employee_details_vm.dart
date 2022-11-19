import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/employees/employee_details/check_activity/check_activity.dart';

final employeeDetailsVmProvider =
    ChangeNotifierProvider.autoDispose<EmployeeDetailsVm>((ref) {
  return EmployeeDetailsVm();
});

class EmployeeDetailsVm extends ChangeNotifier {
  bool isSearchExpand = false;
  bool _isPaid = false;
  bool get isPaid => _isPaid;
  void setIsPaid(val) {
    _isPaid = val;
    notifyListeners();
  }

  String _previousSalaryMonth = "Month";
  String _previousSalaryYear = "Year";

  String get previousSalaryMonth => _previousSalaryMonth;
  String get previousSalaryYear => _previousSalaryYear;

  void setYearMonth(year,month) {
    _previousSalaryMonth = month;
    _previousSalaryYear = year;

    notifyListeners();
  }


  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onNetSalaryPayTap() {}
  void onCheckActivityTap(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CheckActivityScreen()));
  }
}
