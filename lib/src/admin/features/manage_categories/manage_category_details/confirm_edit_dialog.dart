import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/manage_categories/manage_category_details/manage_category_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class ConfirmEditDialog extends StatefulWidget {
  final String isSamePrice;
  final String samePrice;
  final String shoulderPrice;
  final String mediumPrice;
  final String longPrice;

  const ConfirmEditDialog(
      {Key? key,
      required this.isSamePrice,
      required this.samePrice,
      required this.shoulderPrice,
      required this.mediumPrice,
      required this.longPrice})
      : super(key: key);

  @override
  State<ConfirmEditDialog> createState() => _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends State<ConfirmEditDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(manageCategoryDetailsVmProvider);
      //Edit Confirm Dialog
      confirmDialog(BuildContext context) {
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
                    "Do you want to edit the price of length products?",
                    textAlign: TextAlign.center,
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
                        onPressed: () => _vm.onEditTap(context,
                            isSamePrice: widget.isSamePrice,
                            samePrice: widget.samePrice,
                            shoulderPrice: widget.shoulderPrice,
                            mediumPrice: widget.mediumPrice,
                            longPrice: widget.longPrice),
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
          child: confirmDialog(context));
    });
  }
}
