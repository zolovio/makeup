import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/manage_categories/manage_category_details/edit_price_diaglog/edit_price_diaglog_vm.dart';
import 'package:makeup/src/core/ui/common_widget/admin_custom_banner_tiles.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EditPriceDialogScreen extends StatefulWidget {
  final bool isSame;
  final String samePrice;
  final String shoulderPrice;
  final String mediumPrice;
  final String longPrice;

  const EditPriceDialogScreen(
      {Key? key,
      required this.isSame,
      required this.samePrice,
      required this.shoulderPrice,
      required this.mediumPrice,
      required this.longPrice})
      : super(key: key);

  @override
  State<EditPriceDialogScreen> createState() => _EditPriceDialogScreenState();
}

class _EditPriceDialogScreenState extends State<EditPriceDialogScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController shoulder =
        TextEditingController(text: widget.shoulderPrice);
    final TextEditingController medium =
        TextEditingController(text: widget.mediumPrice);
    final TextEditingController long =
        TextEditingController(text: widget.longPrice);
    final TextEditingController same =
        TextEditingController(text: widget.samePrice);

    return Consumer(builder: (context, ref, _) {
      final _editPriceDialogVm = ref.watch(editPriceDialogVmProvider);
      //Edit Different Price Dialog
      editPriceDialog(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 280.h,
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
                  "Select length and price",
                  style: AppDecoration.textStyle(
                      fontSize: 20.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, left: 18.h, right: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20.h,
                      width: 100.h,
                      child: Text(
                        "Length",
                        textAlign: TextAlign.center,
                        style: AppDecoration.textStyle(
                            fontSize: 18.h,
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 20.h,
                        width: 60.h,
                        child: Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: AppDecoration.textStyle(
                              fontSize: 18.h,
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              PriceBannerTiles(controller: shoulder, title: "Shoulder"),
              PriceBannerTiles(controller: medium, title: "Medium"),
              PriceBannerTiles(controller: long, title: "Long"),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: DialogsButton(
                    buttonText: "Save",
                    onButtonTap: () => _editPriceDialogVm.onSaveTap()),
              )
            ],
          ),
        );
      }

// Edit Same Price Dialog
      editSamePriceDialog(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 180.h,
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
                  "Select length and price",
                  style: AppDecoration.textStyle(
                      fontSize: 20.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, left: 18.h, right: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20.h,
                      width: 100.h,
                      child: Text(
                        "Length",
                        textAlign: TextAlign.center,
                        style: AppDecoration.textStyle(
                            fontSize: 18.h,
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 20.h,
                        width: 60.h,
                        child: Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: AppDecoration.textStyle(
                              fontSize: 18.h,
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
              PriceBannerTiles(controller: same, title: "All"),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: DialogsButton(
                    buttonText: "Save",
                    onButtonTap: () => _editPriceDialogVm.onSaveTap()),
              )
            ],
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: (widget.isSame)
              ? editSamePriceDialog(context)
              : editPriceDialog(context));
    });
  }
}
