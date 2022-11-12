import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manageUsersVmProvider =
    ChangeNotifierProvider.autoDispose<ManageUsersVm>((ref) {
  return ManageUsersVm();
});

class ManageUsersVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<UsersData> usersDataList = [
    UsersData(
      serialNum: "1.",
      name: "Sami Ullah",
      phoneNum: "+923320934646",
    ),
    UsersData(
      serialNum: "2.",
      name: "Abc Xyz",
      phoneNum: "+923322324500",
    ),
    UsersData(
      serialNum: "3.",
      name: "User Name3",
      phoneNum: "+923328880000",
    ),
    UsersData(
      serialNum: "4.",
      name: "User Name3",
      phoneNum: "+923328880000",
    ),
    UsersData(
      serialNum: "5.",
      name: "User Nameeeee",
      phoneNum: "+923328880000",
    ),
    UsersData(
      serialNum: "6.",
      name: "User Name3",
      phoneNum: "+923328880000",
    ),
    UsersData(
      serialNum: "7.",
      name: "User Name3",
      phoneNum: "+923328880000",
    ),
    UsersData(
      serialNum: "8.",
      name: "User Name3",
      phoneNum: "+923328880000",
    ),
  ];

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onUserTap() {}
}

class UsersData {
  final String serialNum;
  final String name;
  final String phoneNum;

  UsersData({
    required this.serialNum,
    required this.name,
    required this.phoneNum,
  });
}
