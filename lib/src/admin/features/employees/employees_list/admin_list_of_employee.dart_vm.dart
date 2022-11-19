import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/src/admin/features/employees/employee_details/employee_details.dart';
import 'package:makeup/src/core/ui/common_widget/waiting_screen.dart';

final employeesListVmProvider =
    ChangeNotifierProvider.autoDispose<EmployeesListVm>((ref) {
  return EmployeesListVm();
});

class EmployeesListVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<EmployeesData> employeesDataList = [
    EmployeesData(
        imgUrl: "",
        dob: "18/06/2000",
        anniversary: "11/11/2020",
        weekOff: "Sunday",
        salary: "20000",
        email: "xyz@gmail.com",
        name: "Sami Ullah",
        phoneNum: "+923320934646",
        attendance: "Present"),
    EmployeesData(
        imgUrl: "",
        dob: "01/01/1990",
        anniversary: "11/10/2022",
        weekOff: "Monday",
        salary: "30000",
        email: "abc@gmail.com",
        name: "Jenifer",
        phoneNum: "+441111123456",
        attendance: "Absent"),
  ];

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onEmployeeTap(context,
      {required String imgUrl,
      required String name,
      required String dob,
      required String anniversary,
      required String salary,
      required String weekOff,
      required String email,
      required String phoneNum}) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EmployeeDetailsScreen(
            imgUrl: imgUrl,
            employeeName: name,
            dob: dob,
            anniversary: anniversary,
            salary: salary,
            weekOff: weekOff,
            email: email,
            mobileNum: phoneNum)));
  }
}

class EmployeesData {
  final String imgUrl;
  final String dob;
  final String anniversary;
  final String salary;
  final String weekOff;
  final String email;
  final String name;
  final String phoneNum;
  final String attendance;

  EmployeesData({
    required this.imgUrl,
    required this.name,
    required this.dob,
    required this.anniversary,
    required this.salary,
    required this.weekOff,
    required this.email,
    required this.phoneNum,
    required this.attendance,
  });
}
