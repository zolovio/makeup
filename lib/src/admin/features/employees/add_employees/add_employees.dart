import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:makeup/src/admin/features/customer/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/employees/add_employees/add_employees_vm.dart';
import 'package:makeup/src/admin/features/employees/add_employees/week_off_dialog/week_off_dialog.dart';
import 'package:makeup/src/core/ui/common_widget/admin_user_circular_avatar.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AddEmployeesScreen extends StatefulWidget {
  const AddEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeesScreen> createState() => _AddEmployeesScreenState();
}

class _AddEmployeesScreenState extends State<AddEmployeesScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController anniversaryController = TextEditingController();

  Widget customTextField({
    title,
    hintTxt,
    controller,
    fieldName,
    iconName,
    textBoard,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
        ),
        Text(
          title,
          style: AppDecoration.textStyle(
            color: AppColors.yellow,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        FormBuilderTextField(
          enabled: (title == "Week Off") ? false : true,
          style:
              AppDecoration.textStyle(color: AppColors.white, fontSize: 22.sp),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconName,
                color: AppColors.yellow,
              ),
              suffixIcon: (title == "Week Off")
                  ? SizedBox(
                      height: 10.h,
                      width: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_box_outlined,
                            color: AppColors.hintColor,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.hintColor,
                              size: 40.sp,
                            ),
                          )
                        ],
                      ),
                    )
                  : null,
              filled: true,
              fillColor: Color.fromRGBO(36, 36, 36, 1),
              border: AppDecoration.inputBorder,
              focusedBorder: AppDecoration.inputBorder,
              enabledBorder: AppDecoration.inputBorder,
              disabledBorder: AppDecoration.inputBorder,
              hintText: hintTxt,
              hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
          name: fieldName,
          controller: controller,
          onChanged: (val) {
            _formKey.currentState!.fields[fieldName]!.validate();
            setState(() {});
          },
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
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(addEmployeesVmProvider);
      final TextEditingController weekOffController =
          TextEditingController(text: _vm.weekOffSelected);

      return AdminAppBar(
        searchController: _vm.searchController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                ),
                child: Text(
                  "Add Employees",
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FormBuilder(
                  key: _formKey,
                  child: ListView(
                    physics: const ScrollPhysics(),
                    children: [
                      UserCircularAvatar(
                        url: "",
                        placeHolderLocation: 'assets/person_icon.png',
                        isImageEditable: true,
                        avatarSize: 40,
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
                          controller: numberController,
                          fieldName: 'phoneNo',
                          iconName: CupertinoIcons.phone,
                          textBoard: "phone"),
                      customTextField(
                          title: "Email ID",
                          hintTxt: "abc@gmail.com",
                          controller: emailController,
                          fieldName: 'email',
                          iconName: CupertinoIcons.mail),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const WeekOffDialogScreen();
                              }).then((value) => null);
                        },
                        child: customTextField(
                            title: "Week Off",
                            hintTxt: "Sunday",
                            controller: weekOffController,
                            fieldName: 'weekOff',
                            iconName: Icons.date_range_outlined),
                      ),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              // if (_formKey.currentState!.saveAndValidate()) {
                              _vm.onSubmitTap();
                              // }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 42.h,
                              width: 120.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.white,
                                  )),
                              child: Text(
                                "SUBMIT",
                                style: AppDecoration.textStyle(
                                    letterSpacing: 2.0,
                                    color: AppColors.white,
                                    fontSize: 20.h,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
