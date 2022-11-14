import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/manage_bookings/manage_booking_vm.dart';
import 'package:makeup/src/admin/features/manage_users/manage_users_vm.dart';
import 'package:makeup/src/core/ui/common_widget/users_list_tile.dart';
import 'package:makeup/src/core/ui/theme.dart';

import '../../../core/ui/common_widget/app_decoration.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(manageUsersVmProvider);
      final _bookingsVm = ref.watch(manageBookingVmProvider);

      return AdminAppBar(
        showText: true,
        searchController: _vm.searchController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                    top: 4.h, bottom: 0.5, left: 16.0, right: 35.h),
                dense: true,
                leading: Text(
                  "S No.",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                title: Center(
                  child: Text(
                    "Name   ",
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                trailing: Text(
                  "Mobile",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _vm.usersDataList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: UserListTile(
                        serialNum: _vm.usersDataList[index].serialNum,
                        name: _vm.usersDataList[index].name,
                        phoneNum: _vm.usersDataList[index].phoneNum,
                        onTapFunc: () => _vm.onUserTap(
                          context,
                          _bookingsVm.bookingOrderList,
                          imgUrl: _vm.usersDataList[index].imgUrl,
                          name: _vm.usersDataList[index].name,
                          dob: _vm.usersDataList[index].dob,
                          gender: _vm.usersDataList[index].gender,
                          maritalStatus: _vm.usersDataList[index].maritalStatus,
                          nationality: _vm.usersDataList[index].nationality,
                          address: _vm.usersDataList[index].address,
                          email: _vm.usersDataList[index].email,
                          phoneNum: _vm.usersDataList[index].phoneNum,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
