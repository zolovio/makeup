import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/employees/employee_dashboard/admin_employee_dashboard_vm.dart';

class AdminEmployeeDashboard extends StatefulWidget {
  const AdminEmployeeDashboard({Key? key}) : super(key: key);

  @override
  State<AdminEmployeeDashboard> createState() => _AdminEmployeeDashboardState();
}

class _AdminEmployeeDashboardState extends State<AdminEmployeeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(adminEmployeeDashboardVmProvider);
      return Scaffold(
        body: _vm.children()[_vm.selectedIndex],
        bottomNavigationBar: Container(
          height: 70.0,
          color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < _vm.navBarsItems().length; i++)
                GestureDetector(
                  onTap: () {
                    _vm.setSeletedNavBar(i);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _vm.selectedIndex == i
                          ? _vm.navBarsItems()[i].icon
                          : _vm.navBarsItems()[i].inactiveIcon,
                      Text(
                        _vm.navBarsItems()[i].title,
                        style: TextStyle(
                            // fontFamily: Constant().font,
                            color: _vm.selectedIndex == i
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.0),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}
