import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/admin/features/admin_after_login/admin_after_login_vm.dart';
import 'package:makeup/src/admin/features/customer/home/admin_home_screen.dart';
import 'package:makeup/src/admin/features/employees/employee_home/employee_home.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_check_box.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(adminAfterLoginVmProvider);
      return Drawer(
        backgroundColor: AppColors.black,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.h, top: 30.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Logged in as",
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomCheckBox(
              label: "Customer Panel",
              isCutomerOrEmployee: _vm.isCustomer,
              navigateToFunc: () {
                _vm.setIsCustomer(true);
                _vm.setIsEmployee(false);
                navigatorKey.currentState!
                    .pushReplacementNamed(AppRouter.adminDashboard);
              },
            ),
            CustomCheckBox(
              label: "Employees Panel",
              isCutomerOrEmployee: _vm.isEmployee,
              navigateToFunc: () {
                _vm.setIsCustomer(false);
                _vm.setIsEmployee(true);
                navigatorKey.currentState!
                    .pushReplacementNamed(AppRouter.adminEmployeeDashboard);
              },
            ),
          ],
        ),
      );
    });
  }
}
