import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assignDaysHoursVmProvider =
    ChangeNotifierProvider.autoDispose<AssignDaysHoursVm>((ref) {
  return AssignDaysHoursVm();
});

class AssignDaysHoursVm extends ChangeNotifier {
  String _assignedHours = '4';
  String get assignedHours => _assignedHours;
  void setAssignedHours(val) {
    _assignedHours = val;
    notifyListeners();
  }

  final List _weekDaysList = [
    {'title': "Sunday", 'value': false},
    {'title': 'Monday', 'value': false},
    {'title': 'Tuesday', 'value': false},
    {'title': 'Wednesday', 'value': false},
    {'title': 'Thursday', 'value': false},
    {'title': 'Friday', 'value': false},
    {'title': 'Saturday', 'value': false},
  ];
  List get weekDaysList => _weekDaysList;
  void setWeekDaysList(index, val) {
    _weekDaysList[index]['value'] = val;
    notifyListeners();
  }

  final List _assignedDays = [
    {'title': "Sunday", 'value': true},
    {'title': 'Monday', 'value': true},
  ];

  List get assignedDays => _assignedDays;
  void setAssignedDays(val) {
    _assignedDays.add(val);
    notifyListeners();
  }
}
