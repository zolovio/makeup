import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weekOffDialogVmProvider =
    ChangeNotifierProvider.autoDispose<WeekOffDialogVm>((ref) {
  return WeekOffDialogVm();
});

class WeekOffDialogVm extends ChangeNotifier {
  String _weekOff = '';
  String get weekOff => _weekOff;
  void setWeeKOffSelection(val) {
    _weekOff = val;
    notifyListeners();
  }
}
