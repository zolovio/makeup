import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/employees/employee_details/check_activity/check_activity_vm.dart';
import 'package:makeup/src/admin/features/employees/employee_details/check_previous_salary/check_previous_salary.dart';
import 'package:makeup/src/admin/features/employees/employee_details/employee_details_vm.dart';
import 'package:makeup/src/admin/features/employees/employee_details/pay_net_salary_dialog/pay_net_salary.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CheckActivityScreen extends StatefulWidget {
  const CheckActivityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckActivityScreen> createState() => _CheckActivityScreenState();
}

class _CheckActivityScreenState extends State<CheckActivityScreen> {
  Widget customTextField(
      {title, controller, iconName, isSalary, onTimeEditTap}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 115.h,
          child: Text(
            title,
            style: AppDecoration.textStyle(
              color: AppColors.yellow,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Container(
              height: 40.h,
              width: (isSalary == "no") ? 70.h : 85.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5.h,
                  ),
                  Icon(
                    iconName,
                    color: AppColors.yellow,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text(
                    controller,
                    style: AppDecoration.textStyle(
                        color: AppColors.hintColor, fontSize: 20.sp),
                  )
                ],
              ),
            ),
            if (title == 'Check-In Time' || title == 'Check-Out Time')
              GestureDetector(
                onTap: () => onTimeEditTap(),
                child: SizedBox(
                  width: 30.h,
                  child: Icon(
                    CupertinoIcons.pencil_circle,
                    color: AppColors.yellow,
                    size: 25.sp,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(checkActivityVmProvider);

      return AdminAppBar(
        searchController: _vm.searchController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 40.h,
                pinned: true,
                backgroundColor: AppColors.black,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '${_vm.checkActivityDate} / ${_vm.checkActivityDay}',
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    height: 330.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextField(
                                title: "Check-In Time",
                                controller: _vm.checkInTime,
                                iconName: CupertinoIcons.clock_solid,
                                onTimeEditTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                      return Theme(
                                          data: ThemeData.dark().copyWith(
                                              colorScheme:
                                                  const ColorScheme.dark(
                                            primary: AppColors.yellow,
                                            onPrimary: Colors.white,
                                            onSecondary: AppColors.hintColor,
                                          )),
                                          child: child!);
                                    },
                                  );
                                  if (pickedTime != null) {
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    String formattedTime = DateFormat("HH:mm a")
                                        .format(parsedTime);
                                    _vm.setCheckInTime(formattedTime);
                                  }
                                },
                              ),
                              customTextField(
                                title: "Check-Out Time",
                                controller: _vm.checkOutTime,
                                iconName: CupertinoIcons.clock_solid,
                                onTimeEditTap: () async {
                                  //Time Picker
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                      return Theme(
                                          data: ThemeData.dark().copyWith(
                                              colorScheme:
                                                  const ColorScheme.dark(
                                            primary: AppColors.yellow,
                                            onPrimary: Colors.white,
                                            onSecondary: AppColors.hintColor,
                                          )),
                                          child: child!);
                                    },
                                  );
                                  if (pickedTime != null) {
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    String formattedTime = DateFormat("HH:mm a")
                                        .format(parsedTime);
                                    _vm.setCheckOutTime(formattedTime);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextField(
                                  title: "OverTime",
                                  controller: "2 hrs",
                                  iconName: CupertinoIcons.clock_solid,
                                  isSalary: "no"),
                              customTextField(
                                  title: "Total working hours",
                                  controller: "11 hrs",
                                  iconName: CupertinoIcons.clock_solid,
                                  isSalary: "no"),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextField(
                                  title: "Salary of today",
                                  controller: "2000",
                                  iconName: Icons.currency_rupee_rounded,
                                  isSalary: "yes"),
                              customTextField(
                                title: "Salary till today",
                                controller: "60000",
                                iconName: Icons.currency_rupee_rounded,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
