import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/employees/add_employees/add_employees_vm.dart';
import 'package:makeup/src/admin/features/employees/add_employees/week_off_dialog/week_off_dialog_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class WeekOffDialogScreen extends StatefulWidget {
  const WeekOffDialogScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WeekOffDialogScreen> createState() => _WeekOffDialogScreenState();
}

class _WeekOffDialogScreenState extends State<WeekOffDialogScreen> {
  List weekOffList = [
    {'title': "Sunday", 'value': false},
    {'title': 'Monday', 'value': false},
    {'title': 'Tuesday', 'value': false},
    {'title': 'Wednesday', 'value': false},
    {'title': 'Thursday', 'value': false},
    {'title': 'Friday', 'value': false},
    {'title': 'Saturday', 'value': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(addEmployeesVmProvider);
      final _vm1 = ref.watch(weekOffDialogVmProvider);
      weekOffDialog(BuildContext caontext) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 310.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(13.2.r),
                  border: Border.all(color: AppColors.hintColor),
                ),
                child: Text(
                  "Week Off",
                  style: AppDecoration.textStyle(
                      fontSize: 19.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.h, right: 18.h),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: weekOffList.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          height: 30.h,
                          child: CheckboxListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: AppColors.hint2Color),
                              ),
                              activeColor: Colors.transparent,
                              controlAffinity: ListTileControlAffinity.trailing,
                              dense: true,
                              title: Text(weekOffList[index]['title'],
                                  style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontWeight: FontWeight.w600)),
                              value:
                                  (_vm1.weekOff == weekOffList[index]['title'])
                                      ? true
                                      : weekOffList[index]['value'],
                              onChanged: (val) {
                                setState(() {
                                  for (var e in weekOffList) {
                                    e['value'] = false;
                                  }
                                  weekOffList[index]['value'] = val;
                                  _vm1.setWeeKOffSelection(
                                      weekOffList[index]['title']);
                                });
                              }),
                        );
                      })),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: DialogsButton(
                    buttonText: "Save",
                    onButtonTap: () {
                      _vm.setWeeKOff(_vm1.weekOff);
                      Navigator.of(context).pop();
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: weekOffDialog(context));
    });
  }
}
