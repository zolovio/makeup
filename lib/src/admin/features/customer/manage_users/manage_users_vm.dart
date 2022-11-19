import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/customer/manage_bookings/manage_booking_vm.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/user_details.dart';
import 'package:makeup/src/core/ui/common_widget/waiting_screen.dart';

final manageUsersVmProvider =
    ChangeNotifierProvider.autoDispose<ManageUsersVm>((ref) {
  return ManageUsersVm();
});

class ManageUsersVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<UsersData> usersDataList = [
    UsersData(
      serialNum: "1.",
      imgUrl: "",
      dob: "18/06/2000",
      gender: "Male",
      maritalStatus: "Single",
      nationality: "Pakistani",
      address: "Abc",
      email: "xyz@gmail.com",
      name: "Sami Ullah",
      phoneNum: "+923320934646",
    ),
    UsersData(
      serialNum: "2.",
      imgUrl: "",
      dob: "01/01/1990",
      gender: "Female",
      maritalStatus: "Married",
      nationality: "American",
      address: "xyz",
      email: "abc@gmail.com",
      name: "Jenifer",
      phoneNum: "+441111123456",
    ),
  ];

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

// bookings order list
  List<BookingOrderData> userBookingDataList = [];

  void onUserTap(BuildContext context, userBookingList,
      {required String imgUrl,
      required String name,
      required String dob,
      required String gender,
      required String maritalStatus,
      required String nationality,
      required String address,
      required String email,
      required String phoneNum}) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);

    userBookingDataList = [];
    userBookingList.forEach(
      (val) {
        if (name == val.customerName) {
          userBookingDataList.add(val);
        }
      },
    );

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserDetailsScreen(
            imgUrl: imgUrl,
            userName: name,
            dob: dob,
            gender: gender,
            maritalStatus: maritalStatus,
            nationality: nationality,
            address: address,
            email: email,
            mobileNum: phoneNum)));
  }
}

class UsersData {
  final String serialNum;
  final String imgUrl;
  final String dob;
  final String gender;
  final String maritalStatus;
  final String nationality;
  final String address;
  final String email;
  final String name;
  final String phoneNum;

  UsersData({
    required this.serialNum,
    required this.imgUrl,
    required this.name,
    required this.dob,
    required this.gender,
    required this.maritalStatus,
    required this.nationality,
    required this.address,
    required this.email,
    required this.phoneNum,
  });
}
