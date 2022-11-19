import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/employees/employee_dashboard/admin_employee_dashboard_vm.dart';
import 'package:makeup/src/admin/features/employees/employee_home/employee_home_vm.dart';
import 'package:makeup/src/admin/features/employees/employees_list/admin_list_of_employee.dart_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_container.dart';
import 'package:makeup/src/core/ui/common_widget/operations_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(employeeHomeVmProvider);
      final _vm1 = ref.watch(adminEmployeeDashboardVmProvider);
      final _employeeListVm = ref.watch(employeesListVmProvider);

      return AdminAppBar(
        searchController: _vm.searchController,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CustomContainer(
                        upperLabel:
                            "${_employeeListVm.employeesDataList.length}",
                        btmLabel: "Total Employees"),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.hint2Color)),
                        child: Text(
                          "Operations",
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  OperationButton(
                      btnLabel: "Employees List",
                      onButtonTap: () => _vm1.setSeletedNavBar(1)),
                  OperationButton(
                      btnLabel: "Add Employees",
                      onButtonTap: () => _vm1.setSeletedNavBar(2)),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
