import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/employees/employee_details/assign_days_hours/assign_days_hours_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AssignDaysHoursScreen extends StatefulWidget {
  final bool view;
  const AssignDaysHoursScreen({
    Key? key,
    required this.view,
  }) : super(key: key);

  @override
  State<AssignDaysHoursScreen> createState() => _AssignDaysHoursScreenState();
}

class _AssignDaysHoursScreenState extends State<AssignDaysHoursScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _hours = TextEditingController();

    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(assignDaysHoursVmProvider);
      TextEditingController _viewHours =
          TextEditingController(text: _vm.assignedHours);

      // assign hours days
      assignDaysHours(BuildContext caontext) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 380.h,
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
                  "Assign Hours / Days to work",
                  style: AppDecoration.textStyle(
                      fontSize: 18.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 42.h),
                child: Row(
                  children: [
                    Text("Enter Hours to work",
                        style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 60.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 50.h,
                      child: TextField(
                          textAlign: TextAlign.center,
                          style:
                              AppDecoration.textStyle(color: AppColors.white),
                          controller: _hours,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: AppDecoration.inputBorder,
                            focusedBorder: AppDecoration.inputBorder,
                            hintText: "0",
                            hintStyle:
                                AppDecoration.textStyle(color: AppColors.white),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 42.h),
                child: Text("Select Days for work",
                    style: AppDecoration.textStyle(
                        color: AppColors.yellow, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.h, right: 18.h),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _vm.weekDaysList.length,
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
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              title: Text(_vm.weekDaysList[index]['title'],
                                  style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontWeight: FontWeight.w600)),
                              value: _vm.weekDaysList[index]['value'],
                              onChanged: (value) {
                                _vm.setWeekDaysList(index, value);
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
                      _vm.setAssignedHours(_hours.text);
                      // _vm.weekDaysList.forEach((element) {
                      //   if (element["value"] == true) {
                      //     _vm.setAssignedDays(element);
                      //   }
                      // });
                      // print(_vm.assignedDays);
                      // print(_vm.assignedHours);

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

      // view hours days
      viewAssignDaysHours(BuildContext caontext) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 330.h,
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
                  "Assign Hours / Days to work",
                  style: AppDecoration.textStyle(
                      fontSize: 18.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 42.h),
                child: Row(
                  children: [
                    Text("Selected Hours",
                        style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 60.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 50.h,
                      child: TextField(
                          textAlign: TextAlign.center,
                          enabled: false,
                          style:
                              AppDecoration.textStyle(color: AppColors.white),
                          controller: _viewHours,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixText: "Hr",
                            disabledBorder: AppDecoration.inputBorder,
                            focusedBorder: AppDecoration.inputBorder,
                            hintText: "0",
                            hintStyle:
                                AppDecoration.textStyle(color: AppColors.white),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 42.h),
                child: Text("Selected Days",
                    style: AppDecoration.textStyle(
                        color: AppColors.yellow, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.h, right: 18.h),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _vm.assignedDays.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          height: 30.h,
                          child: CheckboxListTile(
                              enabled: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: AppColors.hint2Color),
                              ),
                              activeColor: Colors.transparent,
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              title: Text(_vm.weekDaysList[index]['title'],
                                  style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontWeight: FontWeight.w600)),
                              value: _vm.assignedDays[index]['value'],
                              onChanged: (value) {}),
                        );
                      })),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: DialogsButton(
                    buttonText: "Close",
                    onButtonTap: () {
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
          child: (widget.view)
              ? viewAssignDaysHours(context)
              : assignDaysHours(context));
    });
  }
}
