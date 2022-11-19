import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/customer/manage_bookings/confirm_booking_dialog.dart';
import 'package:makeup/src/admin/features/customer/manage_bookings/manage_booking_vm.dart';
import 'package:makeup/src/core/ui/common_widget/confirm_booking_card.dart';

class ManageBookingScreen extends StatefulWidget {
  const ManageBookingScreen({Key? key}) : super(key: key);

  @override
  State<ManageBookingScreen> createState() => _ManageBookingScreenState();
}

class _ManageBookingScreenState extends State<ManageBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(manageBookingVmProvider);
      return AdminAppBar(
        searchController: _vm.searchController,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _vm.bookingOrderList.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ConfirmCard(
                  customerName: _vm.bookingOrderList[index].customerName,
                  productName: _vm.bookingOrderList[index].productName,
                  productSize: _vm.bookingOrderList[index].productSize,
                  dateTime: _vm.bookingOrderList[index].dateTime,
                  email: _vm.bookingOrderList[index].email,
                  address: _vm.bookingOrderList[index].address,
                  amount: _vm.bookingOrderList[index].amount,
                  taxServiceCharge:
                      _vm.bookingOrderList[index].taxServiceCharge,
                  rewardPoints: _vm.bookingOrderList[index].rewardPoints,
                  convenienceFees: _vm.bookingOrderList[index].convenienceFees,
                  totalAmount: _vm.bookingOrderList[index].totalAmount,
                  onCancelTap: () => _vm.onCancelTap(),
                  onConfirmTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ConfirmBookingDialog();
                        }).then((value) => null);
                  }),
            );
          },
        ),
      );
    });
  }
}
