import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:makeup/src/admin/features/customer/manage_users/manage_users_vm.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/delete_user_dialog.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/save_user_details_dialog.dart';
import 'package:makeup/src/admin/features/customer/manage_users/user_details/user_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/admin_user_circular_avatar.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/confirm_booking_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

class UserDetailsScreen extends StatefulWidget {
  final String imgUrl;
  final String userName;
  final String dob;
  final String gender;
  final String maritalStatus;
  final String nationality;
  final String address;
  final String email;
  final String mobileNum;

  const UserDetailsScreen({
    Key? key,
    required this.imgUrl,
    required this.userName,
    required this.dob,
    required this.gender,
    required this.maritalStatus,
    required this.nationality,
    required this.address,
    required this.email,
    required this.mobileNum,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController firstNameController =
        TextEditingController(text: widget.userName);
    TextEditingController dateOfBirth = TextEditingController(text: widget.dob);
    TextEditingController gender = TextEditingController(text: widget.gender);
    TextEditingController maritalStatus =
        TextEditingController(text: widget.maritalStatus);
    TextEditingController nationality =
        TextEditingController(text: widget.nationality);
    TextEditingController address = TextEditingController(text: widget.address);
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController mobileController =
        TextEditingController(text: widget.mobileNum);
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(userDetailsVmProvider);
      final _manageUserVm = ref.watch(manageUsersVmProvider);
      return Container(
        color: AppColors.black,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.sp),
                child:
                    Image.asset('assets/logo.png', width: size.width * 0.6.w),
              ),
              Expanded(
                child: Scaffold(
                  backgroundColor: AppColors.black,
                  body: FormBuilder(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10.h),
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: UserCircularAvatar(
                                url: widget.imgUrl,
                                placeHolderLocation: 'assets/person_icon.png',
                                isImageEditable: _vm.isEditable,
                                avatarSize: 40,
                              ),
                            ),
                            Positioned(
                              left: 210.h,
                              child: IconButton(
                                  onPressed: () {
                                    _vm.isEditable
                                        ? _vm.setIsEdited(false)
                                        : _vm.setIsEdited(true);
                                    if (!_vm.isEditable) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const SaveUserDetailsDialog();
                                          }).then((value) => null);
                                    }
                                  },
                                  icon: Icon(
                                    CupertinoIcons.pencil_circle,
                                    size: 40.sp,
                                    color: AppColors.yellow,
                                  )),
                            ),
                            Positioned(
                              left: 245.h,
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ConfirmDeleteUserDialog();
                                        }).then((value) => null);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.trash_circle,
                                    size: 40.sp,
                                    color: AppColors.yellow,
                                  )),
                            ),
                          ],
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
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(36, 36, 36, 1),
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Full Name",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Full Name",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
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
                                enabled: _vm.isEditable,
                                style: AppDecoration.textStyle(
                                    color: AppColors.yellow, fontSize: 20.sp),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.textFieldColor,
                                    border: AppDecoration.inputBorder,
                                    focusedBorder: AppDecoration.inputBorder,
                                    enabledBorder: AppDecoration.inputBorder,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.hintColor),
                                    ),
                                    labelText: "Date Of Birth",
                                    labelStyle: AppDecoration.textStyle(
                                        color: AppColors.hint2Color),
                                    hintText: "Date Of Birth",
                                    hintStyle: AppDecoration.textStyle(
                                        fontSize: 16.0)),
                                name: 'dob',
                                controller: dateOfBirth,
                                onChanged: (val) {
                                  formKey.currentState!.fields['dob']!
                                      .validate();
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
                                enabled: _vm.isEditable,
                                style: AppDecoration.textStyle(
                                    color: AppColors.yellow, fontSize: 20.sp),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.textFieldColor,
                                    border: AppDecoration.inputBorder,
                                    focusedBorder: AppDecoration.inputBorder,
                                    enabledBorder: AppDecoration.inputBorder,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.hintColor),
                                    ),
                                    labelText: "Gender",
                                    labelStyle: AppDecoration.textStyle(
                                        color: AppColors.hint2Color),
                                    hintText: "Gender",
                                    hintStyle: AppDecoration.textStyle(
                                        fontSize: 16.0)),
                                name: 'gender',
                                controller: gender,
                                onChanged: (val) {
                                  formKey.currentState!.fields['gender']!
                                      .validate();
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
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Marital Status",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Marital Status",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
                          name: 'maritalStatus',
                          controller: maritalStatus,
                          onChanged: (val) {
                            formKey.currentState!.fields['maritalStatus']!
                                .validate();
                            setState(() {});
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15.h),
                        FormBuilderTextField(
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Nationality",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Nationality",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
                          name: 'nationality',
                          controller: nationality,
                          onChanged: (val) {
                            formKey.currentState!.fields['nationality']!
                                .validate();
                            setState(() {});
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15.h),
                        FormBuilderTextField(
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Address",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Where Do You Live?",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
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
                        const Divider(
                            color: AppColors.hintColor, thickness: 1.5),
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
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Email",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Email ID",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
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
                          enabled: _vm.isEditable,
                          style: AppDecoration.textStyle(
                              color: AppColors.yellow, fontSize: 20.sp),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldColor,
                              border: AppDecoration.inputBorder,
                              focusedBorder: AppDecoration.inputBorder,
                              enabledBorder: AppDecoration.inputBorder,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    width: 2, color: AppColors.hintColor),
                              ),
                              labelText: "Mobile No.",
                              labelStyle: AppDecoration.textStyle(
                                  color: AppColors.hint2Color),
                              hintText: "Mobile No",
                              hintStyle:
                                  AppDecoration.textStyle(fontSize: 16.0)),
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
                        const Divider(
                            color: AppColors.hintColor, thickness: 1.5),
                        SizedBox(height: 15.h),
                        Text(
                          'BOOKINGS WITH US',
                          style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        (_manageUserVm.userBookingDataList.isNotEmpty)
                            ? ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 1000),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      _manageUserVm.userBookingDataList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 10.h),
                                      child: BookingCard(
                                        customerName: _manageUserVm
                                            .userBookingDataList[index]
                                            .customerName,
                                        productName: _manageUserVm
                                            .userBookingDataList[index]
                                            .productName,
                                        productSize: _manageUserVm
                                            .userBookingDataList[index]
                                            .productSize,
                                        dateTime: _manageUserVm
                                            .userBookingDataList[index]
                                            .dateTime,
                                        email: _manageUserVm
                                            .userBookingDataList[index].email,
                                        address: _manageUserVm
                                            .userBookingDataList[index].address,
                                        amount: _manageUserVm
                                            .userBookingDataList[index].amount,
                                        taxServiceCharge: _manageUserVm
                                            .userBookingDataList[index]
                                            .taxServiceCharge,
                                        rewardPoints: _manageUserVm
                                            .userBookingDataList[index]
                                            .rewardPoints,
                                        convenienceFees: _manageUserVm
                                            .userBookingDataList[index]
                                            .convenienceFees,
                                        totalAmount: _manageUserVm
                                            .userBookingDataList[index]
                                            .totalAmount,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: size.height * 0.06,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.white)),
                                child: Text(
                                  "NO BOOKINGS.",
                                  style: AppDecoration.textStyle(
                                      color: AppColors.white),
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
