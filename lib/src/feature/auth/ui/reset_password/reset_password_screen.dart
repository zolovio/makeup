import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/common_button.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/auth/ui/reset_password/reset_password_vm.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.all(6.r),
          child: IconButton(
            onPressed: () {
              navigatorKey.currentState?.pop();
            },
            icon: Image.asset('assets/back_arrow.png'),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer(builder: (context, ref, _) {
            final _vm = ref.watch(resetPasswordVmProvider);
            return FormBuilder(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Reset Password',
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please enter your \nemail address or phone number \nto request a password reset.',
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FormBuilderTextField(
                        controller: emailController,
                        style: AppDecoration.textStyle(),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            border: AppDecoration.inputBorder,
                            focusedBorder: AppDecoration.inputBorder,
                            enabledBorder: AppDecoration.inputBorder,
                            hintText:
                                "Enter your email address or phone number",
                            hintStyle: AppDecoration.textStyle()),
                        name: 'email',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        onChanged: (val) {
                          _formKey.currentState!.fields['email']!.validate();
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CommonButton(
                      buttonText: 'CONTINUE',
                      onButtonTap: () {
                        FocusScope.of(context).unfocus();
                        // if (_formKey.currentState!.saveAndValidate()) {
                        _vm.onContinueTap();
                        // }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
