import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/profile/profile_vm.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
              'Contact Us',
              style: AppDecoration.textStyle(
                color: AppColors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: InkWell(
            //       onTap: () {
            //         _vm.onSaveTap();
            //       },
            //       child: Text(
            //         'Save',
            //         style: AppDecoration.textStyle(
            //           color: AppColors.yellow,
            //           fontSize: 25.sp,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
            elevation: 3.0,
            shadowColor: AppColors.white,
          ),
          body: FormBuilder(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Contact',
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Us',
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 60.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/phone.png',
                        width: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    CommonContactField(fieldText: '+91 82873 18835'),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormBuilderTextField(
                //         style: AppDecoration.textStyle(
                //             color: AppColors.yellow, fontSize: 20.sp),
                //         decoration: InputDecoration(
                //             filled: true,
                //             fillColor: AppColors.textFieldColor,
                //             border: AppDecoration.inputBorder,
                //             focusedBorder: AppDecoration.inputBorder,
                //             enabledBorder: AppDecoration.inputBorder,
                //             hintText: "Mobile Number",
                //             hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                //         name: 'mobile',
                //         controller: mobileController,
                //         onChanged: (val) {
                //           formKey.currentState!.fields['mobile']!.validate();
                //           setState(() {});
                //         },
                //         validator: FormBuilderValidators.compose([
                //           FormBuilderValidators.required(),
                //         ]),
                //         keyboardType: TextInputType.phone,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/email.png',
                        width: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    CommonContactField(fieldText: 'abc@gmail.com'),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormBuilderTextField(
                //         style: AppDecoration.textStyle(
                //             color: AppColors.yellow, fontSize: 20.sp),
                //         decoration: InputDecoration(
                //             filled: true,
                //             fillColor: AppColors.textFieldColor,
                //             border: AppDecoration.inputBorder,
                //             focusedBorder: AppDecoration.inputBorder,
                //             enabledBorder: AppDecoration.inputBorder,
                //             hintText: "Email Address",
                //             hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                //         name: 'email',
                //         controller: emailController,
                //         onChanged: (val) {
                //           formKey.currentState!.fields['email']!.validate();
                //           setState(() {});
                //         },
                //         validator: FormBuilderValidators.compose([
                //           FormBuilderValidators.required(),
                //           FormBuilderValidators.email(),
                //         ]),
                //         keyboardType: TextInputType.emailAddress,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/location.png',
                        width: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    CommonContactField(fieldText: 'Gurugram Haryana'),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormBuilderTextField(
                //         style: AppDecoration.textStyle(
                //             color: AppColors.yellow, fontSize: 20.sp),
                //         decoration: InputDecoration(
                //             filled: true,
                //             fillColor: AppColors.textFieldColor,
                //             border: AppDecoration.inputBorder,
                //             focusedBorder: AppDecoration.inputBorder,
                //             enabledBorder: AppDecoration.inputBorder,
                //             hintText: "Where Do You Live?",
                //             hintStyle: AppDecoration.textStyle(fontSize: 16.0)),
                //         name: 'address',
                //         controller: address,
                //         onChanged: (val) {
                //           formKey.currentState!.fields['address']!.validate();
                //           setState(() {});
                //         },
                //         validator: FormBuilderValidators.compose([
                //           FormBuilderValidators.required(),
                //         ]),
                //         keyboardType: TextInputType.emailAddress,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/time.png',
                        width: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    CommonContactField(fieldText: '10 am - 8 pm'),
                  ],
                ),
                SizedBox(height: 25.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/map.png',
                        width: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    Image.asset(
                      'assets/map_location.png',
                      height: size.height * 0.2,
                    ),
                  ],
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

class CommonContactField extends StatelessWidget {
  final String fieldText;
  const CommonContactField({Key? key, required this.fieldText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.textFieldColor,
        border: Border.all(
          color: const Color.fromRGBO(160, 160, 160, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          fieldText,
          style: AppDecoration.textStyle(
            color: AppColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
