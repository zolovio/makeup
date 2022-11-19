import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_dashboard_vm.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(adminDashboardVmProvider);
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
