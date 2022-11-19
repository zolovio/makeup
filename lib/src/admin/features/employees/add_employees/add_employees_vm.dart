import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addEmployeesVmProvider =
    ChangeNotifierProvider.autoDispose<AddEmployeesVm>((ref) {
  return AddEmployeesVm();
});

class AddEmployeesVm extends ChangeNotifier {
  bool isSearchExpand = false;
  String _weekOffSelected = '';
  String get weekOffSelected => _weekOffSelected;
  void setWeeKOff(val) {
    _weekOffSelected = val;
    notifyListeners();
  }

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onSubmitTap() {
    print("Submitted");
  }
}
