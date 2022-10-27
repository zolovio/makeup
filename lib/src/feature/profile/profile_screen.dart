import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/circular_avatar.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/profile/profile_vm.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(profileVmProvider);
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: AppBar(
            backgroundColor: AppColors.black,
            iconTheme: const IconThemeData(
              color: AppColors.yellow,
            ),
            title: Text(
              'Edit Profile',
              style: AppDecoration.textStyle(
                color: AppColors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    _vm.onSaveTap();
                  },
                  child: Text(
                    'Save',
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
            elevation: 3.0,
            shadowColor: AppColors.white,
          ),
          body: FormBuilder(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.h),
              children: [
                CircularAvatar(
                  url: '',
                  placeHolderLocation: 'assets/person_icon.png',
                  isImageEditable: true,
                ),
                SizedBox(height: 15.h),
                Text(
                  'GENERAL DETAILS',
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Full Name",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'name',
                  controller: firstNameController,
                  onChanged: (val) {
                    formKey.currentState!.fields['name']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        style: AppDecoration.textStyle(
                            color: AppColors.yellow, fontSize: 20.sp),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            border: AppDecoration.inputBorder,
                            focusedBorder: AppDecoration.inputBorder,
                            enabledBorder: AppDecoration.inputBorder,
                            hintText: "Date Of Birth",
                            hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                        name: 'dob',
                        controller: dateOfBirth,
                        onChanged: (val) {
                          formKey.currentState!.fields['dob']!.validate();
                          setState(() {});
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Expanded(
                      child: FormBuilderTextField(
                        style: AppDecoration.textStyle(
                            color: AppColors.yellow, fontSize: 20.sp),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            border: AppDecoration.inputBorder,
                            focusedBorder: AppDecoration.inputBorder,
                            enabledBorder: AppDecoration.inputBorder,
                            hintText: "Gender",
                            hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                        name: 'gender',
                        controller: gender,
                        onChanged: (val) {
                          formKey.currentState!.fields['gender']!.validate();
                          setState(() {});
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Marital Status",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'maritalStatus',
                  controller: maritalStatus,
                  onChanged: (val) {
                    formKey.currentState!.fields['maritalStatus']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Nationality",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'nationality',
                  controller: firstNameController,
                  onChanged: (val) {
                    formKey.currentState!.fields['nationality']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Where Do You Live?",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'address',
                  controller: address,
                  onChanged: (val) {
                    formKey.currentState!.fields['address']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                const Divider(color: AppColors.hintColor, thickness: 1.5),
                SizedBox(height: 15.h),
                Text(
                  'CONTACT DETAILS',
                  style: AppDecoration.textStyle(
                    color: AppColors.yellow,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Email ID",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'email',
                  controller: emailController,
                  onChanged: (val) {
                    formKey.currentState!.fields['email']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15.h),
                FormBuilderTextField(
                  style: AppDecoration.textStyle(
                      color: AppColors.yellow, fontSize: 20.sp),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      border: AppDecoration.inputBorder,
                      focusedBorder: AppDecoration.inputBorder,
                      enabledBorder: AppDecoration.inputBorder,
                      hintText: "Mobile No",
                      hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                  name: 'mobile',
                  controller: mobileController,
                  onChanged: (val) {
                    formKey.currentState!.fields['mobile']!.validate();
                    setState(() {});
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15.h),
                const Divider(color: AppColors.hintColor, thickness: 1.5),
                SizedBox(height: 15.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.25),
                          offset: Offset(0, 2),
                          blurRadius: 10)
                    ],
                    color: const Color.fromRGBO(36, 36, 36, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(125, 125, 125, 1),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'REWARD POINTS',
                          style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '200',
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
