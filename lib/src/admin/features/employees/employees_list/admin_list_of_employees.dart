import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/employees/employee_dashboard/admin_employee_dashboard_vm.dart';
import 'package:makeup/src/admin/features/employees/employees_list/admin_list_of_employee.dart_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/employee_list_tile.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EmployeesListScreen extends StatefulWidget {
  const EmployeesListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeesListScreen> createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(employeesListVmProvider);
      final _vm1 = ref.watch(adminEmployeeDashboardVmProvider);

      return AdminAppBar(
        searchController: _vm.searchController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: Text(
                  "List",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 50.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 95.h,
                      child: Text(
                        "Name",
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90.h,
                      child: Center(
                        child: Text(
                          "Mobile",
                          style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Attendance",
                      style: AppDecoration.textStyle(
                        color: AppColors.yellow,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _vm.employeesDataList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: EmployeeListTile(
                        name: _vm.employeesDataList[index].name,
                        phoneNum: _vm.employeesDataList[index].phoneNum,
                        attendance: _vm.employeesDataList[index].attendance,
                        // onTapFunc: () => _vm1.setSeletedNavBar(4),
                        onTapFunc: () => _vm.onEmployeeTap(
                          context,
                          imgUrl: _vm.employeesDataList[index].imgUrl,
                          name: _vm.employeesDataList[index].name,
                          dob: _vm.employeesDataList[index].dob,
                          anniversary: _vm.employeesDataList[index].anniversary,
                          salary: _vm.employeesDataList[index].salary,
                          weekOff: _vm.employeesDataList[index].weekOff,
                          email: _vm.employeesDataList[index].email,
                          phoneNum: _vm.employeesDataList[index].phoneNum,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
