import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/employees/employee_details/assign_days_hours/assign_days_hours.dart';
import 'package:makeup/src/admin/features/employees/employee_details/check_activity/check_activity_vm.dart';
import 'package:makeup/src/admin/features/employees/employee_details/check_previous_salary/check_previous_salary.dart';
import 'package:makeup/src/admin/features/employees/employee_details/employee_details_vm.dart';
import 'package:makeup/src/admin/features/employees/employee_details/pay_net_salary_dialog/pay_net_salary.dart';
import 'package:makeup/src/core/ui/common_widget/admin_user_circular_avatar.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/custom_button.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final String imgUrl;
  final String employeeName;
  final String dob;
  final String anniversary;
  final String weekOff;
  final String salary;
  final String email;
  final String mobileNum;

  const EmployeeDetailsScreen({
    Key? key,
    required this.imgUrl,
    required this.employeeName,
    required this.dob,
    required this.anniversary,
    required this.weekOff,
    required this.salary,
    required this.email,
    required this.mobileNum,
  }) : super(key: key);

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  Widget customTextField(
      {title, hintTxt, controller, fieldName, iconName, textBoard, isSalary}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
        ),
        (title == "")
            ? const Center()
            : Text(
                title,
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: (isSalary == "yes") ? 18.sp : 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        SizedBox(height: 8.h),
        (isSalary == "yes")
            ? Container(
                height: 40.h,
                width: (iconName != null) ? 100.h : 60.h,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.h,
                    ),
                    if (iconName != null)
                      Icon(
                        iconName,
                        color: AppColors.yellow,
                        size: 25.sp,
                      ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      controller,
                      style: AppDecoration.textStyle(
                          color: AppColors.hintColor, fontSize: 20.sp),
                    )
                  ],
                ),
              )
            : FormBuilderTextField(
                enabled: (title == "Manage Advanced Salary") ? true : false,
                style: AppDecoration.textStyle(
                    color: AppColors.hintColor, fontSize: 22.sp),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      iconName,
                      color: AppColors.yellow,
                    ),
                    suffixIcon: (title == "Week Off")
                        ? SizedBox(
                            height: 10.h,
                            width: 50.h,
                            child: const Icon(
                              Icons.check_box_outlined,
                              color: AppColors.hintColor,
                            ),
                          )
                        : null,
                    filled: true,
                    fillColor: const Color.fromRGBO(36, 36, 36, 1),
                    border: AppDecoration.inputBorder,
                    focusedBorder: AppDecoration.inputBorder,
                    enabledBorder: AppDecoration.inputBorder,
                    disabledBorder: AppDecoration.inputBorder,
                    hintText: hintTxt,
                    hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                name: fieldName,
                controller: controller,
                onChanged: (val) {},
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                keyboardType: (textBoard == 'phone')
                    ? TextInputType.phone
                    : (textBoard == 'salary')
                        ? TextInputType.number
                        : TextInputType.emailAddress,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController nameController =
        TextEditingController(text: widget.employeeName);
    final TextEditingController dobController =
        TextEditingController(text: widget.dob);
    final TextEditingController anniversaryController =
        TextEditingController(text: widget.anniversary);
    final TextEditingController salaryController =
        TextEditingController(text: widget.salary);
    final TextEditingController emailController =
        TextEditingController(text: widget.email);
    final TextEditingController phoneController =
        TextEditingController(text: widget.mobileNum);
    final TextEditingController weekOffController =
        TextEditingController(text: widget.weekOff);
    final TextEditingController advancedSalaryController =
        TextEditingController();

    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(employeeDetailsVmProvider);
      final _checkActivityVm = ref.watch(checkActivityVmProvider);

      return AdminAppBar(
        searchController: _vm.searchController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              //Profile Details
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.black,
                automaticallyImplyLeading: false,
                title: Text(
                  "Profile Details",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.white)),
                    child: Column(
                      children: [
                        UserCircularAvatar(
                          url: widget.imgUrl,
                          placeHolderLocation: 'assets/person_icon.png',
                          isImageEditable: true,
                          avatarSize: 35,
                        ),
                        customTextField(
                            title: "Name",
                            hintTxt: "Full Name",
                            controller: nameController,
                            fieldName: 'name',
                            iconName: CupertinoIcons.person),
                        customTextField(
                            title: "Number",
                            hintTxt: "1234567890",
                            controller: phoneController,
                            fieldName: 'phoneNo',
                            iconName: CupertinoIcons.phone,
                            textBoard: "phone"),
                        customTextField(
                            title: "Email ID",
                            hintTxt: "abc@gmail.com",
                            controller: emailController,
                            fieldName: 'email',
                            iconName: CupertinoIcons.mail),
                        customTextField(
                            title: "Week Off",
                            hintTxt: "Sunday",
                            controller: weekOffController,
                            fieldName: 'weekOff',
                            iconName: Icons.date_range_outlined),
                        customTextField(
                            title: "Salary per hour",
                            hintTxt: "0000",
                            controller: salaryController,
                            fieldName: 'salary',
                            iconName: Icons.currency_rupee_rounded,
                            textBoard: "salary"),
                        customTextField(
                            title: "Birthday",
                            hintTxt: "DD/MM/YYYY",
                            controller: dobController,
                            fieldName: 'dob',
                            iconName: Icons.date_range_outlined),
                        customTextField(
                            title: "Anniversary",
                            hintTxt: "DD/MM/YYYY",
                            controller: anniversaryController,
                            fieldName: 'anniversary',
                            iconName: Icons.date_range_outlined),
                      ],
                    ),
                  ),
                ),
              ),
              //Salary Management
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.black,
                automaticallyImplyLeading: false,
                title: Text(
                  "Salary Management",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    height: 330.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextField(
                                  title: "Today's Check-In",
                                  controller: "10:00 AM",
                                  iconName: CupertinoIcons.clock_solid,
                                  isSalary: "yes"),
                              customTextField(
                                  title: "Today's Check-Out",
                                  controller: "19:00 PM",
                                  iconName: CupertinoIcons.clock_solid,
                                  isSalary: "yes"),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextField(
                                  title: "Total Salary",
                                  controller: "50000",
                                  iconName: Icons.currency_rupee_rounded,
                                  isSalary: "yes"),
                              customTextField(
                                  title: "Advanced Paid",
                                  controller: "10000",
                                  iconName: Icons.currency_rupee_rounded,
                                  isSalary: "yes"),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  " Net Salary",
                                  style: AppDecoration.textStyle(
                                    color: AppColors.yellow,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              customTextField(
                                  title: "",
                                  controller: "40000",
                                  iconName: Icons.currency_rupee_rounded,
                                  isSalary: "yes"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 105.h,
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: AppColors.hint2Color),
                              ),
                              dense: true,
                              checkColor: AppColors.yellow,
                              activeColor: Colors.transparent,
                              title: Text(
                                (!_vm.isPaid) ? "Mark as paid" : "Paid",
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              value: _vm.isPaid,
                              onChanged: (value) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const NetSalaryPayDialog();
                                    }).then((value) => null);
                              }),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80.h,
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    "Check previous salary history",
                                    textAlign: TextAlign.center,
                                    style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // Pick Date
                                  DateTime? pickDateDay = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2045),
                                    builder: (context, child) {
                                      return Theme(
                                          data: ThemeData.dark().copyWith(
                                              colorScheme:
                                                  const ColorScheme.dark(
                                            primary: AppColors.yellow,
                                            onPrimary: Colors.white,
                                            onSecondary: AppColors.hintColor,
                                          )),
                                          child: child!);
                                    },
                                  );
                                  var pickedYear =
                                      DateFormat('yyyy').format(pickDateDay!);
                                  var pickedMonth =
                                      DateFormat('MMM').format(pickDateDay);
                                  _vm.setYearMonth(pickedYear, pickedMonth);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                      child: Center(
                                        child: customTextField(
                                            title: "",
                                            controller: _vm.previousSalaryYear,
                                            isSalary: "yes"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.h,
                                    ),
                                    SizedBox(
                                      height: 70.h,
                                      child: Center(
                                        child: customTextField(
                                            title: "",
                                            controller: _vm.previousSalaryMonth,
                                            isSalary: "yes"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CheckPreviousSalaryDialog(
                                            month: _vm.previousSalaryMonth,
                                            salary: "34000",
                                          );
                                        }).then((value) => null);
                                  },
                                  icon: const Icon(
                                    Icons.check_box,
                                    color: AppColors.yellow,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 16),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    height: 280.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Assign days and hours
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "Assign Hours / Days to work",
                                    style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    height: 45.h,
                                    width: 55.h,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: AppColors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: AppColors.yellow,
                                            size: 50.sp,
                                          ),
                                          Positioned(
                                            left: 8,
                                            top: 12,
                                            child: Icon(
                                              CupertinoIcons.plus,
                                              color: AppColors.yellow,
                                              size: 30.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Center(
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AssignDaysHoursScreen(
                                              view: true,
                                            );
                                          }).then((value) => null);
                                    },
                                    child: Text(
                                      "View",
                                      style: AppDecoration.textStyle(
                                        color: AppColors.yellow,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " / ",
                                    style: AppDecoration.textStyle(
                                      color: AppColors.yellow,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AssignDaysHoursScreen(
                                              view: false,
                                            );
                                          }).then((value) => null);
                                    },
                                    child: Text(
                                      "Edit",
                                      style: AppDecoration.textStyle(
                                        color: AppColors.yellow,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Manage Advanced Salary
                        SizedBox(
                          width: 300.h,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 150.h,
                                child: customTextField(
                                  title: "Manage Advanced Salary",
                                  controller: advancedSalaryController,
                                  fieldName: "advancedSalary",
                                  hintTxt: "0000",
                                  textBoard: "salary",
                                  iconName: Icons.currency_rupee_rounded,
                                ),
                              ),
                              Positioned(
                                left: 150.h,
                                top: 30.h,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Save',
                                      style: AppDecoration.textStyle(
                                          color: AppColors.yellow,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //check activity
                        SizedBox(
                          width: 100.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "Check activity",
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              GestureDetector(
                                onTap: () async {
                                  // Pick Date
                                  DateTime? pickDateDay = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2045),
                                    builder: (context, child) {
                                      return Theme(
                                          data: ThemeData.dark().copyWith(
                                              colorScheme:
                                                  const ColorScheme.dark(
                                            primary: AppColors.yellow,
                                            onPrimary: Colors.white,
                                            onSecondary: AppColors.hintColor,
                                          )),
                                          child: child!);
                                    },
                                  );
                                  var pickedDate = DateFormat('dd-MM-yyyy')
                                      .format(pickDateDay!);
                                  var pickedDay =
                                      DateFormat('EEEE').format(pickDateDay);
                                  _checkActivityVm.setCheckActivityDateAndDay(
                                      pickedDate, pickedDay);
                                  _vm.onCheckActivityTap(context);
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 55.h,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.white),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: AppColors.yellow,
                                          size: 50.sp,
                                        ),
                                        Positioned(
                                          left: 8,
                                          top: 12,
                                          child: Icon(
                                            CupertinoIcons.plus,
                                            color: AppColors.yellow,
                                            size: 30.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
