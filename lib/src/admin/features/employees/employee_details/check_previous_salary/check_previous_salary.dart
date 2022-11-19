import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/employees/employee_details/employee_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CheckPreviousSalaryDialog extends StatefulWidget {
  final String month;
  final String salary;

  const CheckPreviousSalaryDialog(
      {Key? key, required this.month, required this.salary})
      : super(key: key);

  @override
  State<CheckPreviousSalaryDialog> createState() =>
      _CheckPreviousSalaryDialogState();
}

class _CheckPreviousSalaryDialogState extends State<CheckPreviousSalaryDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(employeeDetailsVmProvider);

      //CheckSalary Dialog
      checkPreviousSalaryDialog(BuildContext context, month, salary) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 140.h,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Previous Salary",
                    style: AppDecoration.textStyle(
                        fontSize: 20.h,
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        month,
                        style: AppDecoration.textStyle(
                            fontSize: 16.h,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "₹",
                            style: AppDecoration.textStyle(
                                fontSize: 16.h,
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: salary,
                                style: AppDecoration.textStyle(
                                    fontSize: 16.h,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Paid",
                        style: AppDecoration.textStyle(
                            fontSize: 16.h,
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child:
              checkPreviousSalaryDialog(context, widget.month, widget.salary));
    });
  }
}
