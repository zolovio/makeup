import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/user_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class ConfirmDeleteUserDialog extends StatefulWidget {
  const ConfirmDeleteUserDialog({Key? key}) : super(key: key);

  @override
  State<ConfirmDeleteUserDialog> createState() =>
      _ConfirmDeleteUserDialogState();
}

class _ConfirmDeleteUserDialogState extends State<ConfirmDeleteUserDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(userDetailsVmProvider);
      //Delete Dialog
      deleteDialog(BuildContext context) {
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
                    "Do you want to delete?",
                    style: AppDecoration.textStyle(
                        fontSize: 18.h,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        splashColor: AppColors.hintColor,
                        iconSize: 40.h,
                        onPressed: () => _vm.onDeleteTap(),
                        icon: const Icon(
                          CupertinoIcons.checkmark_rectangle,
                          color: AppColors.yellow,
                        )),
                    IconButton(
                      iconSize: 43.h,
                      onPressed: () => Navigator.of(context).pop(false),
                      icon: const Icon(
                        Icons.cancel_presentation_outlined,
                        color: AppColors.yellow,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: deleteDialog(context));
    });
  }
}
