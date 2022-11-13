import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/admin_dashboard/admin_dashboard_vm.dart';
import 'package:makeup/src/admin/features/home/admin_home_vm.dart';
import 'package:makeup/src/admin/features/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/home/edit_banner/edit_banner.dart';
import 'package:makeup/src/admin/features/home/edit_rewards/edit_reward.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_container.dart';
import 'package:makeup/src/core/ui/common_widget/operations_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(adminHomeVmProvider);
      final _vm1 = ref.watch(adminDashboardVmProvider);
      return AdminAppBar(
        searchController: _vm.searchController,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(upperLabel: "4", btmLabel: "Total Users"),
                  CustomContainer(upperLabel: "4", btmLabel: "Total Bookings")
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.hint2Color)),
                        child: Text(
                          "Operations",
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  OperationButton(
                      btnLabel: "Manage Bookings",
                      onButtonTap: () => _vm1.setSeletedNavBar(1)),
                  OperationButton(
                      btnLabel: "Manage Users",
                      onButtonTap: () => _vm1.setSeletedNavBar(2)),
                  OperationButton(
                      btnLabel: "Manage Categories",
                      onButtonTap: () => _vm1.setSeletedNavBar(3)),
                  OperationButton(
                      btnLabel: "Edit Banner",
                      onButtonTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const EditBannerScreen();
                            }).then((value) => null);
                      }),
                  OperationButton(
                      btnLabel: "Edit Rewards",
                      onButtonTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const EditRewardScreen();
                            }).then((value) => null);
                      }),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
