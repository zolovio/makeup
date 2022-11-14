import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/home/edit_rewards/edit_reward_vm.dart';
import 'package:makeup/src/core/ui/common_widget/admin_custom_banner_tiles.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EditRewardScreen extends StatefulWidget {
  const EditRewardScreen({Key? key}) : super(key: key);

  @override
  State<EditRewardScreen> createState() => _EditRewardScreenState();
}

class _EditRewardScreenState extends State<EditRewardScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController reward = TextEditingController();

    return Consumer(builder: (context, ref, _) {
      final _editRewardVm = ref.watch(editRewardVmProvider);
      //Edit Reward Dialog
      editRewardDialog(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.hintColor,
              ),
              color: AppColors.black),
          height: 220.h,
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
                  "Edit Rewards",
                  style: AppDecoration.textStyle(
                      fontSize: 20.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
              ),
              BannerTiles(
                  isReward: true,
                  controller: reward,
                  title: "Reward Points Percentage"),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      splashColor: AppColors.hintColor,
                      iconSize: 40.h,
                      onPressed: () {
                        _editRewardVm.onSubmitTap();
                      },
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
        );
      }

      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: editRewardDialog(context));
    });
  }
}
