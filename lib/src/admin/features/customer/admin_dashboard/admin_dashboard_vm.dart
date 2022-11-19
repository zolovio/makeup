import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/customer/manage_categories/manage_categories.dart';
import 'package:makeup/src/admin/features/customer/manage_users/manage_users.dart';
import '../home/admin_home_screen.dart';
import '../manage_bookings/manage_bookings.dart';

final adminDashboardVmProvider =
    ChangeNotifierProvider.autoDispose<AdminDashboardVm>((ref) {
  return AdminDashboardVm();
});

class AdminDashboardVm extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSeletedNavBar(val) {
    _selectedIndex = val;
    notifyListeners();
  }

  List<Widget> children() => [
        const AdminHomeScreen(),
        const ManageBookingScreen(),
        const ManageUsersScreen(),
        const ManageCategoryScreen(),
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
          'assets/shopping.png',
          // color: Theme.of(context).primaryColor,
          height: 25.0,
          width: 25.0,
        ),
        inactiveIcon: Image.asset(
          'assets/shopping.png',
          height: 25.0,
          width: 25.0,
        ),
        title: ("Bookings"),
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
        title: ("Users"),
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/vector.png',
          // color: Theme.of(context).primaryColor,
          height: 25.0,
          width: 25.0,
        ),
        inactiveIcon: Image.asset(
          'assets/vector.png',
          height: 25.0,
          width: 25.0,
        ),
        title: ("Categories"),
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
