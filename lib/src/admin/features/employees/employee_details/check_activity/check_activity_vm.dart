import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkActivityVmProvider =
    ChangeNotifierProvider.autoDispose<CheckActivityVm>((ref) {
  return CheckActivityVm();
});

class CheckActivityVm extends ChangeNotifier {
  bool isSearchExpand = false;

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  String _checkInTime = "10:30 AM";
  String get checkInTime => _checkInTime;
  void setCheckInTime(val) {
    _checkInTime = val;
    notifyListeners();
  }

  String _checkOutTime = "19:00 PM";
  String get checkOutTime => _checkOutTime;
  void setCheckOutTime(val) {
    _checkOutTime = val;
    notifyListeners();
  }

  String _checkActivityDate = "";
  String _checkActivityDay = "";
  String get checkActivityDate => _checkActivityDate;
  String get checkActivityDay => _checkActivityDay;
  void setCheckActivityDateAndDay(date, day) {
    _checkActivityDate = date;
    _checkActivityDay = day;

    notifyListeners();
  }
}
