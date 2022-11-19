import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/user_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class SaveUserDetailsDialog extends StatefulWidget {
  const SaveUserDetailsDialog({Key? key}) : super(key: key);

  @override
  State<SaveUserDetailsDialog> createState() => _SaveUserDetailsDialogState();
}

class _SaveUserDetailsDialogState extends State<SaveUserDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(userDetailsVmProvider);

      //Save Dialog
      saveDialog(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 125.h,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15, 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to save?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.white)),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.h),
                        child: SizedBox(
                          // height: 40.h,
                          width: 75.w,
                          child: TextButton(
                            child: Text(
                              'Yes',
                              style: AppDecoration.textStyle(
                                color: AppColors.yellow,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () => _vm.onSaveTap(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.h),
                        child: SizedBox(
                          // height: 40.h,
                          width: 75.w,
                          child: TextButton(
                            child: Text(
                              'No',
                              style: AppDecoration.textStyle(
                                color: AppColors.yellow,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: saveDialog(context));
    });
  }
}
