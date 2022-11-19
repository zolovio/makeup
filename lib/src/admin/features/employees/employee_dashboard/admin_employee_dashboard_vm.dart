import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/employees/add_employees/add_employees.dart';
import 'package:makeup/src/admin/features/employees/employee_home/employee_home.dart';
import 'package:makeup/src/admin/features/employees/employees_list/admin_list_of_employees.dart';

final adminEmployeeDashboardVmProvider =
    ChangeNotifierProvider.autoDispose<AdminEmployeeDashboardVm>((ref) {
  return AdminEmployeeDashboardVm();
});

class AdminEmployeeDashboardVm extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSeletedNavBar(val) {
    _selectedIndex = val;
    notifyListeners();
  }

  List<Widget> children() => [
        const EmployeeHomeScreen(),
        const EmployeesListScreen(),
        const AddEmployeesScreen(),
      ];

  List<BottomNavModel> navBarsItems() {
    return [
      BottomNavModel(
        icon: Image.asset(
          'assets/home.png',
          // color: Theme.of(context).primaryColor,
          height: 25.0,
          width: 25.0,
        ),
        inactiveIcon: Image.asset(
          'assets/home.png',
          height: 25,
          width: 25,
        ),
        title: "Home",
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/menu.png',
          // color: Theme.of(context).primaryColor,
          height: 25.0,
          width: 25.0,
        ),
        inactiveIcon: Image.asset(
          'assets/menu.png',
          height: 25.0,
          width: 25.0,
        ),
        title: ("List"),
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/user.png',
          // color: Theme.of(context).primaryColor,
          height: 25.0,
          width: 25.0,
        ),
        inactiveIcon: Image.asset(
          'assets/user.png',
          height: 25.0,
          width: 25.0,
        ),
        title: ("Add Employees"),
      ),
    ];
  }
}

class BottomNavModel {
  final Widget icon;
  final Widget inactiveIcon;
  final String title;

  BottomNavModel(
      {required this.icon, required this.inactiveIcon, required this.title});
}
