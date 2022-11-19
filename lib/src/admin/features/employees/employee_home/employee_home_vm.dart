import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeHomeVmProvider =
    ChangeNotifierProvider.autoDispose<EmployeeHomeVm>((ref) {
  return EmployeeHomeVm();
});

class EmployeeHomeVm extends ChangeNotifier {
  bool isSearchExpand = false;

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }
}
