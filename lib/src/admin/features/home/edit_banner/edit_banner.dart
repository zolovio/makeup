import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/home/edit_banner/edit_banner_vm.dart';
import 'package:makeup/src/core/ui/common_widget/admin_custom_banner_tiles.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EditBannerScreen extends StatefulWidget {
  const EditBannerScreen({Key? key}) : super(key: key);

  @override
  State<EditBannerScreen> createState() => _EditBannerScreenState();
}

class _EditBannerScreenState extends State<EditBannerScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController heading =
        TextEditingController(text: "Special Offer");
    final TextEditingController body =
        TextEditingController(text: "Black Friday");
    final TextEditingController offer =
        TextEditingController(text: "Up TO 50% OFF");

    return Consumer(builder: (context, ref, _) {
      final _editBannerVm = ref.watch(editBannerVmProvider);
      //Edit Banner Dialog
      editBannerDialog(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 340.h,
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
                  "Edit Banner",
                  style: AppDecoration.textStyle(
                      fontSize: 20.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              BannerTiles(controller: heading, title: "Heading"),
              BannerTiles(controller: body, title: "Body"),
              BannerTiles(controller: offer, title: "Offer"),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: DialogsButton(
                    buttonText: "SUBMIT",
                    onButtonTap: () => _editBannerVm.onSubmitTap()),
              )
            ],
          ),
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: editBannerDialog(context));
    });
  }
}
